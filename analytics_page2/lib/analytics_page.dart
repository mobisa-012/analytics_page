import 'package:analytics_page2/pathconstants.dart';
import 'package:analytics_page2/textconstants.dart';
import 'package:flutter/material.dart';

class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({super.key});

  @override
  State<AnalyticsPage> createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5, left: 10),
      color: Colors.white,
      height: double.infinity,
      width: double.infinity,
      child: _createBody(context),
    );
  }

  Widget _createBody(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        children: [
          _createProfileData(context),
          const SizedBox(
            height: 35,
          ),
          const HomeStatistics(),
          const SizedBox(
            height: 30,
          ),
          _createMetrics(context),
        ],
      ),
    );
  }

  Widget _createProfileData(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Hi, let\'s check your activity',
          style: TextStyle(
            fontSize: 20,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w900,
            color: Colors.black,
          ),
        )
      ],
    );
  }

  Widget _createMetrics(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch, 
      children: [
      Container(
        padding: const EdgeInsets.all(10),
        width: screenWidth,
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _createHeightField(context),
            const SizedBox(
              height: 5,
            ),
            //_createWeightField(context),
            const SizedBox(
              height: 2,
            ),
            //_createBMI(),
            const SizedBox(
              height: 2,
            ),
            //_createWater(context),
          ],
        ),
      )
    ]);
  }

  Widget _createHeightField(BuildContext context) {
    var value = 0;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          TextConstants.height,
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        Material(),
      ],
    );
  }
}

class HomeStatistics extends StatefulWidget {
  const HomeStatistics({super.key});

  @override
  State<HomeStatistics> createState() => _HomeStatisticsState();
}

class _HomeStatisticsState extends State<HomeStatistics> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _createCompletedWorkouts(context),
          _createColumnStatistics(),
        ],
      ),
    );
  }

  Widget _createCompletedWorkouts(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 200,
      width: screenWidth * 0.35,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.12),
                blurRadius: 2.0,
                spreadRadius: 0.5),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: const [
              Image(image: AssetImage(PathConstants.finished)),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  TextConstants.finished,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                  overflow: TextOverflow.fade,
                  softWrap: false,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _createColumnStatistics() {
    return Column(
      children: const [
        DataWorkouts(
            icon: PathConstants.inProgress,
            title: TextConstants.inProgress,
            count: 2,
            text: TextConstants.workouts),
        SizedBox(
          height: 20,
        ),
        DataWorkouts(
          icon: PathConstants.time,
          title: TextConstants.time,
          text: TextConstants.minutes,
          count: 62,
        )
      ],
    );
  }
}

class DataWorkouts extends StatelessWidget {
  final String icon;
  final String title;
  final String text;
  final int count;

  const DataWorkouts(
      {super.key,
      required this.icon,
      required this.title,
      required this.text,
      required this.count});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 90,
      width: screenWidth * 0.5,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.12),
                blurRadius: 5.0,
                spreadRadius: 1.1)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Image(image: AssetImage(icon)),
              const SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              )
            ],
          ),
          Row(
            children: [
              Text(
                count.toString(),
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                text,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              )
            ],
          )
        ],
      ),
    );
  }
}
