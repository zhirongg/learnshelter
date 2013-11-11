Feature:

As a User 
I want to be able to add events to my event calender
So I can make personal events others may not need.

As a User 
I want to be able to edit events on my event calender
So I can make changes to events I already saved

As a User
I want to be able to delete events on my calendar
So that I can remove events that have passed or been canceled

Background:
  When I am on the calendar page
  And I press "Add New Event"
  When I fill in "Event Name" with "my event"
  And I press "Save Event"
  Then I should be on the calendar page

Scenario: Add new event
  And I should see "my event"

Scenario: Edit event
  When I follow "my event"
  When I follow "Edit"
  And I fill in "Event Name" with "my new event"
  And I press "Save Changes"
  Then I should see "my new event"
  And I follow "Back to calendar"
  Then I should be on the calendar page
  And I should see "my new event"

Scenario: Delete event
  When I follow "my event"
  When I press "Delete"
  Then I should be on the calendar page
  And I should see "'my event' deleted"



