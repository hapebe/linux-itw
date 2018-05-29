#!/usr/bin/php
<?php
define("RECHNER", "linux-gateway");
define("OBJEKT", "dropbox"); // 100k, dropbox, spon
$out = fopen('./'.OBJEKT.'-'.RECHNER.'-ms.txt', 'w');

$date = FALSE;
$time = FALSE;
$speed = FALSE;
$ms = FALSE;

$cnt = 0;

$lines = file('./zusammenfassung-'.OBJEKT.'-'.RECHNER.'.log');
foreach ($lines as $line) {
	$line = trim($line);

	if (strpos($line, "download") !== FALSE) {
		// print($line."\n");
		$parts = explode(" ", $line);
		$date = $parts[0];

		$time = $parts[1];

		$speed = $parts[2]; $unit = $parts[3];
		$speed = str_replace('(', '', $speed);
		$speed = str_replace(',', '.', $speed);
		if (startsWith('K', $unit)) $speed /= 1000.0;
		// print($speed."M\n");

	} else if (startsWith("real", $line)) {
		// output of the time command:
		$line = trim(str_replace("real", "", $line));

		$parts=explode("m", $line);
		$ms = 60*$parts[0];

		$parts[1] = str_replace(',', '', $parts[1]);
		$parts[1] = str_replace('.', '', $parts[1]);
		$parts[1] = str_replace('s', '', $parts[1]);
		$parts[1] = trim($parts[1]);

		$ms += $parts[1];
		// print($line." = ".$ms."ms\n");

		// we have a performance value, we'll export it:
		$dateParts = explode('-', $date);
			$year = $dateParts[0];
			$month = $dateParts[1];
			$day = $dateParts[2];
		$timeParts = explode(':', $time);
			$hour = $timeParts[0];
			$minute = $timeParts[1];
			$second = $timeParts[2];

		$timestamp = mktime($hour, $minute, $second, $month, $day, $year);

		fputs($out,
			$year
			."\t".$month
			."\t".$day
			."\t".$hour
			."\t".$minute
			."\t".$timestamp
			."\t".$speed
			."\t".$ms
			."\n"
		);
		$cnt ++;


		// clean up for a new record:
		$date = FALSE;
		$time = FALSE;
		$speed = FALSE;
		$ms = FALSE;
	}
}

fclose($out);
print "Es wurden $cnt Datensätze exportiert.\n";


function startsWith($needle, $haystack) {
	if (strpos($haystack, $needle) === 0) return true;
	return false;
}
?>
