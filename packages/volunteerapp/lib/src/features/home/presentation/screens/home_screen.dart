import 'package:flutter/material.dart';
import 'package:cave/cave.dart';
import 'package:go_router/go_router.dart';

import '../../../../routing/routing.dart';
import '../widgets/analytics_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> attendees = List.generate(
    10,
    (index) => {
      'checkedIn': index % 2 == 0,
      'fullName': 'John Doe${index + 1}',
      'email': 'john${index + 1}@example.com',
      'ticketId': 'T00${index + 1}'
    },
  );

  @override
  Widget build(BuildContext context) {
    final textTheme = DevfestTheme.of(context).textTheme;
    final headerStyle = textTheme?.bodyBody3Semibold
        ?.copyWith(fontWeight: FontWeight.w600, color: const Color(0xFF1E1E1E));
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: SvgPicture.asset(
          'images/logo.svg',
          package: 'cave',
          width: 16,
          height: 29,
          semanticsLabel: 'GDG Logo',
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 24.w),
            child: OutlinedButton.icon(
              onPressed: () {},
              label: Text(
                'Log out',
                style: textTheme?.bodyBody3Semibold
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              icon: const Icon(
                IconsaxOutline.login,
                color: DevfestColors.backgroundDark,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 24.w, bottom: 16.h, top: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '☺️ Welcome Sarah',
                style: textTheme?.titleTitle1Semibold?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: DevfestColors.grey10,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Check-in overview',
                      style: textTheme?.bodyBody1Medium?.copyWith(
                        color: DevfestColors.grey10,
                      ),
                    ),
                    OutlinedButton.icon(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        backgroundColor: DevfestColors.primariesYellow90,
                        side: BorderSide.none,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 4),
                      ),
                      label: Text(
                        'Day 1',
                        style: textTheme?.bodyBody3Semibold?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: DevfestColors.grey10,
                        ),
                      ),
                      icon: const Icon(
                        IconsaxOutline.arrow_down_1,
                        color: DevfestColors.grey10,
                      ),
                      iconAlignment: IconAlignment.end,
                    )
                  ],
                ),
              ),
              25.verticalSpace,
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 138.h),
                child: const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      AnalyticsCard(
                        title: "Total Tickets",
                        amount: 5000,
                        analysis: "7% up this week",
                      ),
                      AnalyticsCard(
                        title: "Total Check-ins",
                        amount: 5000,
                        analysis: "7% up this week",
                      ),
                      AnalyticsCard(
                        title: "Total unchecked",
                        amount: 5000,
                        analysis: "7% up this week",
                      ),
                    ],
                  ),
                ),
              ),
              40.verticalSpace,
              Padding(
                padding: EdgeInsets.only(right: 24.w),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 48),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextFormField(
                          onTap: () =>
                              context.goNamed(Devfest2024Routes.search.name),
                          enabled: true,
                          readOnly: true,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              IconsaxOutline.search_normal_1,
                              size: 20,
                            ),
                            hintText: 'Search for name, email, ticket id',
                            hintStyle: textTheme?.bodyBody4Medium?.copyWith(
                              color: DevfestColors.grey60,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 0),
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              borderSide: BorderSide(
                                  color: DevfestColors.grey70, width: 1),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              borderSide: BorderSide(
                                  color: DevfestColors.grey70, width: 1),
                            ),
                          ),
                        ),
                      ),
                      8.horizontalSpace,
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          fixedSize: const Size.fromHeight(48),
                          backgroundColor: DevfestColors.grey10,
                        ),
                        child: Text(
                          'Scan QR code',
                          style: textTheme?.bodyBody3Semibold?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: DevfestColors.grey100,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              16.verticalSpace,
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                        color: Colors.black,
                        width: 0.25,
                      ),
                    ),
                    child: DataTable(
                      headingTextStyle: headerStyle,
                      columns: const <DataColumn>[
                        DataColumn(label: Text('Checked In')),
                        DataColumn(label: Text('Full Name')),
                        DataColumn(label: Text('Email Address')),
                        DataColumn(label: Text('Ticket ID')),
                      ],
                      rows: attendees.map((attendee) {
                        return DataRow(
                          cells: <DataCell>[
                            DataCell(
                              Center(
                                child: Checkbox(
                                    semanticLabel: 'Checkin user',
                                    value: attendee['checkedIn'],
                                    onChanged: (bool? value) {
                                      setState(() {
                                        attendee['checkedIn'] = value ?? false;
                                      });
                                    },
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    side: const BorderSide(
                                      color: DevfestColors.backgroundDark,
                                      width: 1.5,
                                    ),
                                    checkColor: DevfestColors.backgroundLight,
                                    activeColor: const Color(0xFF141B34),
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.padded,
                                    visualDensity: VisualDensity.standard),
                              ),
                            ),
                            DataCell(
                              Row(
                                children: [
                                  Container(
                                    width: 32.w,
                                    height: 32.w,
                                    decoration: BoxDecoration(
                                      color: DevfestColors.primariesYellow100,
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(
                                        color: DevfestColors.grey60,
                                        width: 1,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        attendee['fullName']
                                            .split(' ')
                                            .map((e) => e[0])
                                            .take(2)
                                            .join(),
                                        style: textTheme?.bodyBody4Regular
                                            ?.copyWith(
                                                color: const Color(0xFF1E1E1E)),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    attendee['fullName'],
                                    style:
                                        textTheme?.bodyBody4Regular?.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF1E1E1E),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            DataCell(
                              Text(
                                attendee['email'],
                                style: textTheme?.bodyBody4Regular?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFF1E1E1E),
                                ),
                              ),
                            ),
                            DataCell(
                              Text(
                                attendee['ticketId'],
                                style: textTheme?.bodyBody4Regular?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFF1E1E1E),
                                ),
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
