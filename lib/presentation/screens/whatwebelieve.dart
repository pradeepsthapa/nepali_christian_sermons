// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:gradient_widgets/gradient_widgets.dart';
//
// class AboutSection extends StatelessWidget {
//
//   nested() {
//     return NestedScrollView(
//         headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//           return <Widget>[
//             SliverAppBar(
//               expandedHeight: 130, floating: true,pinned: true,
//               flexibleSpace: FlexibleSpaceBar(
//                 centerTitle: true,
//                 title: Padding(
//                   padding: const EdgeInsets.only(bottom: 9),
//                   child: Text("Introduction to Calvary Chapel",textAlign: TextAlign.center,),
//                 ),
//                 background: Image.asset(
//                   'assets/images/background/about.jpg', fit: BoxFit.cover,),
//               ),
//             )
//           ];
//         }, body: Padding(
//           padding: const EdgeInsets.all(17.0),
//           child: SingleChildScrollView(
//             child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text("Calvary Chapel Nepal (CCN) ministries are connected to and are doctrinally aligned with Calvary Chapel, which is a non-denominational church movement focused on the inerrancy of the Bible and the expository teaching from Genesis to Revelation.",
//                 textAlign: TextAlign.justify),
//                 Text('\nThe following doctrinal Statement of Faith governs the teaching at CCN ministries.'),
//                 Text('\nI. Scripture'),
//                 Text('\nWe believe the Bible (i.e., the sixty-six books of the Old and New Testaments) is the Word of God, comprises the totality of Holy Scripture, is verbally inspired and inerrant in the original text, remains inerrant and infallible in all its substance, and is sufficient for salvation and sanctification. Therefore, it is the supreme, final, and authoritative standard for faith, theology, and life. We seek to teach the Word of God in such a way that its message can be applied to an individual’s life, leading that person to greater maturity in Christ. (CCBC affirms the Chicago Statement on Biblical Inerrancy)',
//                 textAlign: TextAlign.justify),
//                 Text('\nII. Historicity'),
//                 Text('\nWe believe in the full historicity and perspicuity of the biblical record of primeval history, including the literal existence of Adam and Eve as the progenitors of all people, the literal fall in the Garden of Eden and resultant divine curse on creation, the worldwide cataclysmic deluge, and the origin of the nations and languages at the tower of Babel.',
//                   textAlign: TextAlign.justify),
//                 Text('\nIII. God'),
//                 Text('\nWe believe that the triune God eternally exists in one essence and three distinct persons: Father, Son and Holy Spirit; that He is essentially Spirit, personal, transcendent, sovereign, life, love, truth, almighty, simple (i.e., essentially one without parts), timelessly eternal, unchangeable, wise, just, holy, relational, pure actuality, dynamic, infallible in all things, including His foreknowledge of all future decisions and events, '
//                     'and that He created the heavens and the earth in six literal days', textAlign: TextAlign.justify),
//                 Text('\nIV. Jesus Christ'),
//                 Text('\nWe believe that Jesus Christ is fully God and fully human, possessing two distinct natures which are co-joined in one person; that He was miraculously conceived by the Holy Spirit, born of the virgin Mary, lived a sinless and miraculous life, provided for the atonement of our sins by His vicarious substitutionary death on the Cross, was physically resurrected in the same body that was buried in the tomb by the power of the Holy Spirit; that Jesus Christ physically ascended back to the right hand of God the Father in heaven, and ever lives to make intercession for us. After Jesus ascended to Heaven, the Holy Spirit was poured out on the believers in Jerusalem, enabling them to fulfill His command to preach the gospel to the entire world, an obligation shared by all believers today. '
//                     '(CCN affirms the Apostle’s, Nicene, and Athanasian Creeds)', textAlign: TextAlign.justify),
//                 Text('\nV. Holy Spirit'),
//                 Text('\nWe believe the Holy Spirit is the third person of the Godhead who seals, indwells, sanctifies, baptizes, teaches, empowers, reveals, and guides the believer into all truth. The Holy Spirit gives gifts to whom He wills, which are valid for today, and ought to be exercised within scriptural guidelines. We as believers are to earnestly desire the best gifts, seeking to exercise them in love that the whole Body of Christ might be edified. We believe that love is more important than the most spectacular gifts, '
//                     'and without this love all exercise of spiritual gifts is worthless.', textAlign: TextAlign.justify),
//                 Text('\nVI. Mankind'),
//                 Text('\nWe believe that man is created in the image of God; however, after the fall of Adam and Eve, all people are by nature separated from God and responsible for their own sin, but that salvation, redemption, and forgiveness are offered as a free gift by the Lord Jesus Christ to all based on His grace alone. When a person repents of sin and receives Jesus Christ as personal Savior and Lord, trusting Him to save, that person is immediately born again and sealed by the Holy Spirit, all his/her sins are forgiven, and that person becomes a child of God, '
//                     'destined to spend eternity with the Lord.', textAlign: TextAlign.justify),
//                 Text('\nVII. Salvation'),
//                 Text('\nSalvation is initiated, attained, and procured by God through the death of Christ on the cross for our sins and His resurrection from the dead. The salvation Christ offers is available to all, and is received freely by grace alone and through faith in Christ alone, apart from good works, '
//                     'thereby justifying and indwelling the believer.',textAlign: TextAlign.justify),
//                 Text('\nVIII. The Church'),
//                 Text('\nThe universal Church is an organic body composed of all believers, both living and dead, who have been sealed by the Holy Spirit through faith in Jesus Christ for salvation. The church has the responsibility to worship the Lord and share the good news of Christ’s death and resurrection to the world, making disciples, baptizing believers, and teaching them to observe sound doctrine and live a morally pure life. We believe church government should be simple rather than a complex bureaucracy, with the utmost dependence upon the Holy Spirit to lead, rather than on fleshly promotion or worldly wisdom. The Lord has given the church two ordinances which are to continue until He returns — adult baptism by immersion and Holy Communion. Water baptism is not necessary for salvation and cannot remove sins, but is a picture of the salvation already received by the believer. We believe the only true basis of Christian fellowship is Christ’s sacrificial agape love, which is greater than any secondary differences we possess, '
//                     'and without which we have no right to claim ourselves Christians.',textAlign: TextAlign.justify),
//                 Text('\nIX. Worship',),
//                 Text('\nWe believe worship of God should be spiritual. Therefore, we remain flexible and yielded to the leading of the Holy Spirit to direct our worship. We believe worship of God should be inspirational. Therefore, we give great place to music in our worship. We believe worship of God should be intelligent. Therefore, our gatherings are designed with great emphasis upon the teaching of the Word of God that He might instruct us how He should be worshiped. We believe the worship of God should be fruitful. Therefore, we look for His love in our lives as the supreme manifestation that we have been '
//                     'truly worshiping God in spirit and truth.', textAlign: TextAlign.justify),
//                 Text('\nX. Christ’s Return'),
//                 Text('\nWe await the pre-tribulational rapture of the church and the second coming of Christ which will be physical, personal, visible, and pre-millennial. This motivates us to evangelism, holy living, heart-felt worship, committed service, diligent study of God’s Word, '
//                     'and regular fellowship.', textAlign: TextAlign.justify),
//                 Text('\nXI. Eternity'),
//                 Text('\nWe believe those who are saved by Jesus Christ will spend eternity with Christ in heaven in a conscious state of blessedness, reward, and satisfaction; that those who do not personally receive the finished work of Christ by faith will spend eternity separated from God in a state of '
//                     'conscious torment.', textAlign: TextAlign.justify,),
//                 Text('\nXII. Satan',),
//                 Text('\nWe believe there is a real personal devil of great malevolence, cunning, and power, who seeks to deceive, tempt, kill, steal and destroy, yet his power is limited by God to only what God permits him to do; that the devil has been defeated positionally at the cross of Christ, and will be defeated practically at Christ’s glorious second coming which will eventuate in the permanent quarantine and punishment of the Devil, Beast, and False Prophet, '
//                     'in the lake which burns with fire and brimstone.',textAlign: TextAlign.justify),
//                 Text('\nXIII. We Reject:'),
//                 Text('\n(1) The belief that true Christians can be demon possessed and are helpless against the craft and wiles of the Devil.'
//                     '\n\n(2) any philosophy or theology which denies that human freewill can be exercised in the receiving of Christ’s free gift of salvation; specifically, we reject the belief that Jesus’ atonement was limited in its extent, instead, we believe that He died for all unrighteous people and that any perceived limitation rests in one’s free rejection of Christ’s finished work of atonement, and we reject the assertion that God’s wooing grace cannot be resisted or that He has elected some people to go to hell; instead we believe that anyone who wills to come to Christ may do so freely as a result of the Holy Spirit’s conviction and wooing persuasion of the heart,'
//                     '\n\n(3) “positive confession,” (e.g., the Faith Movement, that views faith as a force that can create one’s own reality or that God can be commanded to heal or work miracles according to man’s will and faith);'
//                     '\n\n(4) human prophecy that supersedes or is contrary to Scripture;'
//                     '\n\n(5) any introduction of psychology and philosophy which is contrary to Scripture and is in substance “according to the tradition of men, according to the basic principles of the world, and not according to Christ” into biblical teaching;'
//                     '\n\n(6) “Open Theism” or “Freewill Theism” which reduces God’s timeless, unchanging, dynamic nature, and exhaustive foreknowledge of future free decisions, to creaturely modes of being and operation;'
//                     '\n\n(7) the “Emergent Church” movement insofar as it departs from the historic orthodox Christian doctrines in favor of postmodernism, and,'
//                     '\n\n8) the overemphasis of spiritual gifts, experiential signs and wonders to the exclusion of biblical teaching.',
//                   textAlign: TextAlign.justify),
//
//
//
//               ],
//             ),
//           ),
//         ));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//             gradient: Gradients.deepSpace) ,
//         child: nested(),
//       ),
//     );
//   }
// }
