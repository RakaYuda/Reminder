class Activity {
  String status;
  String title;
  String description;

  Activity({this.status, this.title, this.description});
}

final List<Activity> listActivity = [
  Activity(
      status: 'not active',
      title: 'Change book cover for english and math',
      description:
          'For math due date monday and for english due date is wednesday'),
  Activity(
      status: 'not active',
      title: 'Make a short video conversation with friends',
      description: 'Max long time video is 10 minutes and should be editing'),
  Activity(
      status: 'active',
      title: 'Math Homework',
      description: 'Due date Monday and i still confuse with aljabr'),
  Activity(
      status: 'active',
      title: 'Guitar Practice',
      description: 'Learn about notation and strum pattern'),
  Activity(
      status: 'not active',
      title: 'Exercise',
      description: 'Running and do push up on sunday morning'),
  Activity(
      status: 'active',
      title: 'Sleep',
      description:
          'Sleep before 10 pm and before sleep should read an anything articles'),
];
