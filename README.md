The widget allows to create calendar which shows like the contribution calendar from GitHub.

## Build
For build the widget need to be installed NodeJS na npm.
<pre>
npm install
cake build

#--> lib/js-chart-widgets.js
#--> lib/js-chart-widgets.min.js
</pre>

## How to use

    new Calendar({
      container: 'calendar-id',
      color: '#2a75be',
      data: [
        ['2017-11-01', 123],
        ['2017-11-02', 456.7],
        ['2017-11-04', 234]
      ],
      intervals: [10, 20, 30, 40],
      num_weeks: 52,
      day_size: 10
    });

Where:
  
  - **container** is DOM container id.
  - **color** mail color, which will be used for calculate colors
  - **data** array of elements, where each element is array.
    First is date of activity and count of activity points is second.
  - **intervals** array of intervals which will be used for generate related
    color based on activity points.
  - **num_weeks** Number of weeks to show
  - **day_size** size of each square in pixels.

![](/doc/calendar.png)

## The Means

- Wrap or borrow from other open-source widgets when it makes sense
- Get our NIH on when it doesn't

