
const jwt = require('jsonwebtoken');
const tokenkey = "complexivo";
const db = require ("../database/index");

const registerUser = (req, res) =>{
    const body = req.body;
    db.query("INSERT INTO cliente (NOM_USER,PASS_USER,ID_ROL) VALUES (?,?,?)",[body.userName, body.password,2],
    (err, results, fields)=>{
        if(err){
            console.log(err);
            return res.status(500).json({
                success: false,
                message: "ERROR",
                err,
            })
            return;
        }
        return res.status(200).json({
            success: true,
            message: "No",
            err,

        })

    })

};

const login = async(req, res) =>{
    const {userName,password} =req.body;
 
    db.query("SELECT * FROM cliente WHERE NOM_USER = ?", userName,(err,results)=>{
        if(err){
            console.log(err);
            return res.status(500).json({
                success: false,
                message: "ERROR",
                err,
            }); 
        }
        if (results.length === 0) {
			return res.status(500).json({
				success: false,
				message: "The username or password are incorrect...",
				err,
			});
		}
        let user = results;
        if(!user || password != user[0].PASS_USER){
            return res.status(500).json({
                success: false,
                message: "errop",
                err,
            });

        }
        const token = jwt.sign(
            {
                user,
            },
            tokenkey,
            {
                expiresIn: "36h",
            }
        );
        return res.status(200).json({
            success: true,
            message: "login",
            token,
        });
    });
    

}

module.exports={registerUser,login};