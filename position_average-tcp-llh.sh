num_positions=0;
avg_lat=0;
avg_long=0;
avg_height=0;

netcat 10.10.0.45 9003 | sed -u -n '/^[0-9]\+\s\+[0-9.]\+\s\+[-0-9.]\+\s\+[-0-9.]\+\s\+[-0-9.]\+\s\+[0-9]\s\+/p' | while read line;

do ((num_positions++));
this_lat="`echo "${line}" | awk '{print $3}'`";
this_long="`echo "${line}" | awk '{print $4}'`";
this_height="`echo "${line}" | awk '{print $5}'`";

if [[ num_positions == 1 ]];
	then avg_lat="${this_lat}";
	avg_long="${this_long}";
	avg_height="${this_height}";

else avg_lat="`echo "scale=9;
	${avg_lat}*(${num_positions}-1)/${num_positions}+${this_lat}/(${num_positions})" | bc -l`";
	avg_long="`echo "scale=9;
	${avg_long}*(${num_positions}-1)/${num_positions}+${this_long}/(${num_positions})" | bc -l`";
	avg_height="`echo "scale=4;
	${avg_height}*(${num_positions}-1)/${num_positions}+${this_height}/(${num_positions})" | bc -l`";
fi;

echo "I: $this_lat $this_long $this_height O: $avg_lat $avg_long $avg_height P: $num_positions"; done
