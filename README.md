# founded-in-groningen-event-api

* Meetup
* Facebook Events
* Eventbrite

## Formaat

```
original_provider
original_id
name
description
start_datetime
end_datetime
location
rsvp_link [optional]
```

```
class MeetupAggregator < Yolo
  def fetch
    # returns array of format listed above
  end
end
```

Place all aggregators in `lib/aggregators/`

Put specs (YES, SPECS!) in `spec/`. Use RSpec.
