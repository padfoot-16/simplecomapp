
class UserOrder {
  final String prodname;
  final String useremail;
  final String userid;

  UserOrder({
        required this.prodname,
        required this.useremail, 
        required this.userid
        });

  Map<String,dynamic> toMap(){
        return{
          "prodname":prodname,
          "useremail":useremail,
          "userid":userid,
        };
      }
}
