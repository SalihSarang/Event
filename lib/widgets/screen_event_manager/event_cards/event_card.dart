import 'dart:io';
import 'package:event_vault/database/functions/completed/completed.dart';
import 'package:event_vault/database/functions/event/event.dart';
import 'package:event_vault/database/functions/event_profit/event_profit.dart';
import 'package:event_vault/database/functions/expense/expense.dart';
import 'package:event_vault/database/functions/pending/pending.dart';
import 'package:event_vault/database/modals/completed_events_model/completed.dart';
import 'package:event_vault/database/modals/event_adding/event_adding_modal.dart';
import 'package:event_vault/database/modals/pending_model/pending_model.dart';
import 'package:event_vault/database/modals/profit_model/event_profit_model.dart';
import 'package:event_vault/screen_function/event_manager/event_manager_fn.dart';
import 'package:event_vault/screens/event_edit_screen/event_edit/event_edit_screen.dart';
import 'package:event_vault/screens/event_manager/event_details/event_details.dart';
import 'package:event_vault/utils/font/app_font.dart';
import 'package:event_vault/widgets/alert_box/alert_box.dart';
import 'package:event_vault/widgets/unique_id/unique_id.dart';
import 'package:flutter/material.dart';
import 'package:event_vault/widgets/app_theme/app_theme.dart';

class EventCard extends StatelessWidget {
  EventCard({super.key, required this.event});

  final EventAddModal event;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      width: double.infinity,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => EventDetails(
                image: event.image,
                events: event,
              ),
            ));
          },
          splashColor: AppTheme.hint,
          borderRadius: BorderRadius.circular(15),
          child: Card(
            elevation: 20,
            color: AppTheme.secondary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: FileImage(File(event.image)),
                        fit: BoxFit.cover,
                      ),
                      color: AppTheme.hint,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(13),
                        topRight: Radius.circular(13),
                        bottomLeft: Radius.circular(4),
                        bottomRight: Radius.circular(4),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      title: Text(
                        'Title: ${event.eventName}',
                        style: myFont(size: 20),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Date: ${extract(event.date)}',
                            style: myFont(size: 15),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          Text(
                            'Time: ${event.time}',
                            style: myFont(size: 15),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ],
                      ),
                      trailing: PopupMenuButton(
                        iconColor: AppTheme.textW,
                        color: const Color.fromARGB(255, 55, 58, 92),
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => EventEditScreen(
                                  event: event,
                                ),
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.edit,
                                  color: AppTheme.hilite,
                                ),
                                SizedBox(width: 5),
                                Text('Edit', style: myFont()),
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            onTap: () {
                              customAlertBox(context,
                                  message: "This Event is Completed",
                                  icon: Icons.check_circle_outline_rounded,
                                  color: AppTheme.green, noPressed: () {
                                Navigator.pop(context);
                              }, yesPressed: () {
                                final completedEvent = Completed(
                                  completedID: generateID(),
                                  event: event,
                                );
                                addCompletedEvents(completedEvent);
                                deleteEvent(event.eventId);

                                final expense =
                                    getExpenseForTheEvent(event.eventId);
                                final profit = calculateProfit(
                                    event.budget, expense.totalExpense);

                                final eventProfit = EventProfitModel(
                                  eventId: event.eventId,
                                  profit: profit,
                                  profitId: generateID(),
                                );
                                addEventProfit(eventProfit);
                                Navigator.pop(context);
                              });
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.check_circle_outline_rounded,
                                  color: AppTheme.green,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'Completed',
                                  style: myFontColor(color: AppTheme.green),
                                ),
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            onTap: () {
                              customAlertBox(context,
                                  message:
                                      "You want to move this event to pending",
                                  icon: Icons.pending_actions_rounded,
                                  color: AppTheme.pending, noPressed: () {
                                Navigator.pop(context);
                              }, yesPressed: () {
                                final completedEvent = PendingEvents(
                                  event: event,
                                  pendingID: generateID(),
                                );
                                addPendingEvents(completedEvent);
                                deleteEvent(event.eventId);
                                Navigator.pop(context);
                              });
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.pending_actions_rounded,
                                  color: AppTheme.pending,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'Pending',
                                  style: myFontColor(color: AppTheme.pending),
                                ),
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            onTap: () {
                              customAlertBox(context,
                                  message: "You Want To Delete This Event",
                                  icon: Icons.delete, noPressed: () {
                                Navigator.pop(context);
                              }, yesPressed: () {
                                deleteEvent(event.eventId);
                                Navigator.pop(context);
                              });
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.delete,
                                  color: AppTheme.delete,
                                ),
                                SizedBox(width: 5),
                                Text('Delete', style: myFont()),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
