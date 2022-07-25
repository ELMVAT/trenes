const db = require ("../database/index");

const getrain =(req,res) =>{
    db.query("SELECT * FROM tren;",(err,results)=>{
        if(err){
            return res.status(500).json({
                success: false,
                message: "ERROR",
                err,
            });
        }
        return res.status(200).json({
            success: true,
            message: "TRENES",
            results,
        });
    });

};

const sellsit= (req, res)=>{
    const{userID,trainID,sits}= req.body;
}

module.exports= {getrain, sellsit};