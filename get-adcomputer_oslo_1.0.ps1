$comp = get-adcomputer -filter * -properties *
$list = @{}
foreach ($i in $comp)

{
 $result=$null
 try {$result=Test-Connection -ComputerName $i.name -count 1 -ea stop}
 catch {$list += @{$i.name = "DOWN"}}
 if ($result) {$list += @{$i.name = "UP"}}
}
$list | Select @{l='Server';e={$server}},@{l='Status';e={$status}}