class Middleware {
    constructor(target) {
        this.target = target;
        this.middlewares = [];
        this.req = {};

        const prototype = Object.getPrototypeOf(this.target);
        Object.getOwnPropertyNames(prototype).forEach(fn => {
            if (fn !== "constructor") return this.createFn(fn);
        });
    }

    use(middleware){
        this.middlewares.push(middleware);
    }

    executeMidleware(i = 0){
        if(i < this.middlewares.length){
            this.middlewares[i].call(this, this.req, () => 
            this.executeMidleware(i + 1));
        }
    }

    createFn(fn){
        this[fn] = args => {       
            this.req = args;
            //console.log('this.req', this.req);
            this.req.resp = this.target[fn].call(this, this.req);    
            this.executeMidleware();
            return this.req.resp;
        }
    }
}

module.exports = Middleware