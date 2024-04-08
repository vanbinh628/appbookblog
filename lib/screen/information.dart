import 'package:appbookblog/component/app_bar_infor.dart';
import 'package:appbookblog/component/avatar.dart';
import 'package:appbookblog/component/icon_text.dart';
import 'package:appbookblog/component/item_infor.dart';
import 'package:appbookblog/component/section_divider.dart';
import 'package:flutter/material.dart';

class InformationScreen extends StatefulWidget {
  const InformationScreen({super.key});

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarInformation(
        height: 80,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 18, right: 18, top: 25),
          child: Column(
            children: [
              Row(
                children: [
                  Avatar(),
                  const SizedBox(width: 20),
                  Expanded(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Binh Nguyen Van',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Text('Mobile Developer', style: TextStyle(fontSize: 16)),
                    ],
                  ))
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(top: 12),
                  child:
                      IconText(iconName: Icons.phone, valueText: '0327 637 204')),
              Padding(
                  padding: EdgeInsets.only(top: 12, bottom: 12),
                  child:
                      IconText(iconName: Icons.email, valueText: 'vanbinh628@gmail.com')),

              SectionDivider(
                padding: EdgeInsets.only(top: 20, bottom: 20), 
                title: 'Detail Information'
              ),
              Row(
                children: [
                  ItemInfor(title: 'NickName', detail: 'Aloha'),
                  const SizedBox(width: 12),
                  ItemInfor(title: 'Gener', detail: 'male'),   
                ],
              ),
              ItemInfor(title: 'Address', detail: 'Hiep Thanh, district 12'),
              ItemInfor(title: 'Education', detail: 'Hcmc University Technology And Education'), 
              ItemInfor(title: 'Hobbies', detail: 'Swim, software development'),

               SectionDivider(
                padding: EdgeInsets.only(top: 20, bottom: 20), 
                title: 'Detail Careers'
              ),
              ItemInfor(title: 'Position', detail: 'Mobile developer, Front-End developer', isLong: true),
              ItemInfor(title: 'Technical Skills', detail: 'Flutter, Java Android, React Native', isLong: true),
              ItemInfor(title: 'Other Skills', detail: 'Problem - solving skills, TeamWork'),
              ItemInfor(title: 'Objective', detail: 'I am an experienced software developer with over three years of industry knowledge. Currently, I am looking for a position where I can leverage my expertise and apply the skills I have acquired during this time. My goal is to become a technical leader within the next three years. By joining a new team, I want to learn from my colleagues and contribute dynamically to the company’s growth and success.', isLong: true),      
            ],
          ),
        ),
      ),
    );
  }
}
