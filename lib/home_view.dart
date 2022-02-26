
import 'contact_details_view.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

import 'contact_model.dart';

class Homeview extends StatelessWidget {
  Homeview({ Key? key }) : super(key: key);

  final ScrollController _scrollController = ScrollController();

  final List<Map<String,String>>data =
  [
    {
      "name": "Joey Quah (Sister)",
      "phone": "+65 9812 8129",
      "email": "joey2001@gmail.com",
      "region": "Woodlands",
      "country": "Singapore",
      "image": "assets/beach.jpg",
    },
    {
      "name": "Sarah Mei (Daughter)",
      "phone": "+65 8762 3762",
      "email": "meimei@gmail.com",
      "region": "Jurong East",
      "country": "Singapore",
      "image": "assets/Daughter.png"
    },
    {
      "name": "Ruimin Huang (Niece)",
      "phone": "+65 9372 8789",
      "email": "ruimin@gmail.com",
      "region": "Lakeside",
      "country": "Singapore",
      "image": "assets/blue.png"
    },
    {
      "name": "Charlene Chia (Cousin)",
      "phone": "+65 8399 1647",
      "email": "chiacharlene@gmail.com",
      "region": "Ang Moh kio",
      "country": "Singapore",
      "image": "assets/flowers.jpg"
    },
    {
      "name": "Dr Larry Loke GP",
      "phone": "+65 6777 7677",
      "email": "loke_larry@med.ntu.edu.sg",
      "region": "NTU",
      "country": "Singapore",
      "image": "assets/hiking.jpg",
    },
    {
      "name": "Dr Lim Yuen Xin ENT",
      "phone": "+65 6887 1279",
      "email": "lim_yuenxin@med.ntu.edu.sg",
      "region": "NTU",
      "country": "Singapore",
      "image": "assets/doctor.png",
    },
    {
      "name": "Varsha (Neighbour)",
      "phone": "+65 8723 8299",
      "email": "varsha1234@gmail.com",
      "region": "Clementi",
      "country": "Singapore",
      "image": "assets/blue.png"
    },
    {
      "name": "Yuri Kim",
      "phone": "+82 8382 0912 928",
      "email": "kimyuri@live.com",
      "region": "Seoul",
      "country": "South Korea",
      "image": "assets/seoul.png"
    },
    {
      "name": "Mei Mei (Sister)",
      "phone": "+86 123 329 293 129",
      "email": "ac@google.net",
      "region": "Beijing",
      "country": "China",
      "image": "assets/blue.png"
    },
    {
      "name": "John (SIL)",
      "phone": "+86 129 837 348 238",
      "email": "sem@hotmail.edu",
      "region": "Beijing",
      "country": "China",
      "image" : "assets/Husband&Grandson"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        title: const Text('My Contacts' ,style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,
            color: Colors.black),),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Center(
              child: CircleAvatar(radius: 25,
                backgroundImage: AssetImage('assets/AhMei.png'),),
            ),
          )
        ],
        elevation: 0,
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 5),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  hintText: 'Search by name or number',
                  prefixIcon: const Icon(Icons.search)
              ),

            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          controller: _scrollController,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text('Your Main Caretaker(s)',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            ListView.separated(
                controller: _scrollController,
                shrinkWrap: true,
                itemBuilder: (context,index){
                  return  ListTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return ContactDetailsView(contact: Contact(country: 'Singapore', email: 'meimei@gmail.com',
                            name: 'Sarah Mei (Daughter)',
                            phone: '+65 8762 3762',
                            region: 'Jurong East', image: 'assets/Daughter.png'));
                      }));
                    },
                    leading: const CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('assets/Daughter.png'),
                    ),
                    title: const Text(
                      'Sarah Mei (Daughter)',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    subtitle: const Text('+65 8762 3762'),
                    trailing: const IconButton(onPressed: null, icon: Icon(Icons.more_horiz)),
                  );
                },
                separatorBuilder: (context,index){
                  return  const Divider(
                    indent: 25,
                    thickness: 2,
                  );
                },
                itemCount: 1),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text('Contacts',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),),
            ),
            GroupedListView<Map<String,String>,String>(
              shrinkWrap: true,
              elements:data,
              groupBy: (element) => element['name'].toString().substring(0,1),
              groupSeparatorBuilder: (String groupByValue) =>
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding:const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        groupByValue.substring(0,1),
                        textAlign: TextAlign.right,
                        style:
                        const TextStyle(fontWeight: FontWeight.w600, fontSize: 18 ),
                      ),
                    ),
                  ),
              itemBuilder: (context, Map<String,String> element) {
                Contact contact = Contact.fromJson(element);
                return Column(
                  children: [
                    ListTile(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return ContactDetailsView(contact: contact,);
                        },));
                      },
                      leading: const CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage('assets/blue.png'),
                      ),
                      title: Text(
                        '${element['name']}',
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text('${element['phone']}'),
                      trailing:
                      const IconButton(onPressed: null, icon: Icon(Icons.more_horiz),),),
                    const Divider(
                      indent: 25,
                      thickness: 2,
                    )
                  ],
                );
              },

              itemComparator: (item1, item2) =>
                  item1['name']!.compareTo(item2['name']!), // optional
              useStickyGroupSeparators: true, // optional
              floatingHeader: true, // optional
              order: GroupedListOrder.ASC, // optional
            ),
          ],
        ),
      ),
      floatingActionButton: const FloatingActionButton(
        backgroundColor: Color(0xff1A4ADA),
        onPressed: null,
        child: Icon(Icons.add),),
    );
  }
}