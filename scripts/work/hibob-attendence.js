(() => {
  const SHEET_ID = "2008721"; // You can get the sheet id from the network when choosing it from the dropdown
  const EMPLOYEE_ID = "2779832864215138332"; // This must be a string or hibob request fails, if you go to your profile the ID is in the url
  const PRE_LUNCH = ["09:30", "13:00"];
  const POST_LUNCH = ["14:00", "18:30"];

  fetch(`https://app.hibob.com/api/employees/attendance/my/sheets/${SHEET_ID}`)
    .then(response => response.json())
    .then(data => {
      const missingEntries = data.attendance.filter((a) => a.status === "NoEntries" || a.exceptions.hasOwnProperty("missingEntries"));

      missingEntries.forEach(async (entry) => {
        await fetch(`https://app.hibob.com/api/attendance/employees/${EMPLOYEE_ID}/attendance/entries?forDate=${entry.date}`, {
          method: "POST",
          mode: "cors",
          credentials: "include",
          headers: {
            "content-type": "application/json;charset=UTF-8",
            "bob-timezoneoffset": "-60",
            "x-requested-with": "XMLHttpRequest"
          },
          body: JSON.stringify([
            {
              start: `${entry.date}T${PRE_LUNCH[0]}`,
              end: `${entry.date}T${PRE_LUNCH[1]}`,
              offset: -60
            },
            {
              start: `${entry.date}T${POST_LUNCH[0]}`,
              end: `${entry.date}T${POST_LUNCH[1]}`,
              offset: -60
            }
          ]),
        });
      })
    });
})();
