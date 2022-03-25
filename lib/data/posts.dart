import 'package:shamba_huru/models/post.dart';
import 'package:shamba_huru/models/user.dart';

class postsData {
  List<Post> posts = [
    Post(
      user: UserPost(
        userId: "1",
        username: "Scolastica Milanzi",
        photo: "assets/images/profile.jpg",
        isExpert: true,
      ),
      location: "Mbeya, Tanzania",
      time: "21 Nov 2021 00:00 am",
      tags: ["Soyabean", "Cassava", "Banana"],
      photo: "assets/images/plough.jpg",
      title: "Before Maize cultivation, Do seed treatment like this:",
      description:
          "It is very important to treat the seeds before maize cultivation. Seed treatment protects the crop frrom various diseases. Along with this, the risk of crop damage by may types of fungi is also reduced. You can treat the seeds.",
      likes: 987,
      isFull: false,
    ),
    Post(
      user: UserPost(
        userId: "2",
        username: "Josephat Hassan",
        photo: "assets/images/profile1.jpg",
        isExpert: false,
      ),
      location: "Arusha, Tanzania",
      time: "21 Mar 2022 11:43 am",
      tags: ["Maize", "farm"],
      photo: "assets/images/farming.jpg",
      title: "Kilimo cha mahindi",
      description:
          "Mahindi huwezwa kulimwa na kustawi vizuri katika uwanda wa chini kutoka usawa wa bahari hadi mwinuko wa mita 2500 kutoka usawa wa bahari.Mahindi mengine hukubali katika ukanda wa chini na mengine katika ukanda wa juu.hukua vizuri katika maeneo yapatayo mvua za kutosha kiasi cha milimita 750 na kuendelea kwa mwaka hustawi katika nyuzi joto 22 -33 C.Pia ktokana na msimu mahindi hupandwa mwanzoni mwa mwezi wa 11 baada ya mvua za kwanza kunyesha ambayo huvunwa mwezi Machi mwishoni au aprili mwanzoni. Pia mahindi hupandwa mwanzoni mwa mvua za masika yaani mwezi wa pili mwishoni na mwezi wa tatu mwanzoni ambayo huvunwa mwezi Julai katikati na Agosti mwanzoni .kwa space ya upandaji 75cm(mstari na mstari)-25cm(mche na mche) utakuwa na  miche 5300 kwa space ya 90-30 utakuwa na miche 3700 tuannze na space ya 75cm-25cm utakuwa na miche 5300 kwa mbegu za chotara hubeba mahindi mawili hadi matatu",
      likes: 13,
      isFull: false,
    ),
  ];
}
