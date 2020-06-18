## Quarterly Status Reports Team ##

Contact: Quarterly Status Reports <quarterly@FreBSD.org>
Contact: Daniel Ebdrup Jensen <debdrup@FreeBSD.org>
Contact: Lorenzo Salvadore <salvadore@FreeBSD.org>

Link: [Quarterly status reports](https://www.freebsd.org/news/status/)
Link: [Git repository](https://github.com/freebsd/freebsd-quarterly)

The Quarterly Status Reports Team collects and publish the reports that you are
reading right now. At the moment, its most active members are:

- debdrup, who reviews, merges and sorts the reports;

- salvadore, who maintains the tools used by the team.

Many improvements have been done recently and thus we believe it is useful that
the Quarterly Status Reports Team submits a report. Not all the changes below
are specific to the last quarter, but we list them here anyway since we did not
write an entry for earlier reports.

- Reports are now built using Makefiles. Among the many advantages, this allows
  us to easily sort reports logically. Indeed, starting with 2019Q4, all reports
  are sorted logically, while before they were sorted alphabetically within each
  category.

- The conversion from markdown to docbook was performed using a python script,
  with some known bugs. Salvadore has rewritten the script using perl fixing
  most of the bugs. Some features are missing and many improvements are
  possible, but the script is very unlikely to receive any change since it will
  become obsolete as soon as the conversion to Hugo/AsciiDoctor is completed.

- Another perl script to ease the preparation of the mail version of the
  reports was written.

- One more perl script has been written to allow the quarterly team to send
  quarterly calls automatically using a cron job. We used it this quarter for
  the first time.

- As you might have noticed, last quarterly calls have been sent to
  freebsd-quarterly-calls@: this is a new mailing list to which you can
  [subscribe](https://lists.freebsd.org/mailman/listinfo/freebsd-quarterly-calls)
  to receive calls for quarterly reports. Please note this is a moderated list, 
  with very low traffic and a high signal to noise ratio.

- If you read carefully the last quarterly calls, you should have noticed that
  we now ask you to send reports to quarterly-submissions@ instead of
  quarterly@. This was done to help the quarterly team distinguishing internal
  discussions from submissions. Please keep in mind however that the quarterly
  team prefers receiving pull requests, as they ease the administrative work.

We would like to thank philip@, from the postmaster team, for having created the
freebsd-quarterly-calls@ mailing list and the quarterly-submissions@ address for
us.
