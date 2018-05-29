#!/usr/bin/php
<?php
define("RECHNER", "linux-gateway");
define("OBJEKT", "spon");
$out = fopen('./'.OBJEKT.'-'.RECHNER.'-ms.txt', 'w');

$date = FALSE;
$time = FALSE;
$speed = FALSE;
$ms = FALSE;
$totalBytes = FALSE;

$cnt = 0;

$lines = file('./zusammenfassung-'.OBJEKT.'-'.RECHNER.'.log');
foreach ($lines as $line) {
	$line = trim($line);

	if (startsWith("BEENDET", $line)) {
		// BEENDET --2018-05-24 11:18:40--
		// print($line."\n");
		$parts = explode(" ", $line);
		$date = str_replace('--','',$parts[1]);
		$time = str_replace('--','',$parts[2]);
	} else if (startsWith("Geholt:", $line)) {
		// Geholt: 194 Dateien, 6,3M in 6,0s (1,05 MB/s)
		$parts = explode(" ", $line);
		$n = count($parts);

		$speed = $parts[$n-2]; $unit = $parts[$n-1];
		$speed = str_replace('(', '', $speed);
		$speed = str_replace(',', '.', $speed);
		if (startsWith('K', $unit)) $speed /= 1000.0;
		// print($speed."M\n");

		$sizePart = $parts[3];
		$totalBytes = str_replace(',', '.', $sizePart);
		$totalBytes = str_replace('M', '', $totalBytes);
		// print($totalBytes."\n");

	} else if (startsWith("real", $line)) {
		// output of the time command:
		// Geholt: 193 Dateien, 6,2M in 6,0s (1,03 MB/s)

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
			."\t".$totalBytes
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
		$totalBytes = FALSE;
	}
}

fclose($out);
print "Es wurden $cnt Datensätze exportiert.\n";


function startsWith($needle, $haystack) {
	if (strpos($haystack, $needle) === 0) return true;
	return false;
}
?>
