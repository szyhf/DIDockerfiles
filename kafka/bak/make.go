package main

import (
	"fmt"
	"io/ioutil"
	"strings"
)

type conf struct {
	Des string
	Kv  string
}

func (this conf) String() string {
	// ds := strings.Split(this.Des, " ")
	// defValue := ds[2]

	kvs := strings.Split(this.Kv, "=")
	envName := strings.TrimLeft(kvs[1], "{{")
	envName = strings.TrimRight(envName, "}}")
	// return fmt.Sprintf(`    [ -z "$KAFKA_%s" ] && %s_="# "`, envName, envName)
	return fmt.Sprintf(`    -e "s|{{%s_}}|${%s_:-}|g" \`, envName, envName)
	// if defValue != `""` {
	// 	return fmt.Sprintf(`-e "s|{{%s}}|${KAFKA_%s:-%v}|g" \`, envName, envName, defValue)
	// } else {
	// 	return fmt.Sprintf(`-e "s|{{%s}}|${KAFKA_%s:-}|g" \`, envName, envName)
	// }
}

func main2() {
	data, _ := ioutil.ReadFile("./server.properties.template")
	content := string(data)

	lines := strings.Split(content, "\n")
	confs := make([]conf, 0, len(lines)/2)
	for row, line := range lines {
		if line != "" {
			if []rune(line)[0] != '#' {
				nConf := conf{
					Des: lines[row-1],
					Kv:  line,
				}
				// fmt.Println(line)
				confs = append(confs, nConf)
			}
		}
	}
	var newContent string
	for _, c := range confs {
		newContent = newContent + fmt.Sprintln(c)
	}
	ioutil.WriteFile("./test3.sh", []byte(newContent), 0644)
}

func main() {
	data, _ := ioutil.ReadFile("./server.properties.template")
	content := string(data)

	lines := strings.Split(content, "\n")
	// newLines := make([]string, 0, len(lines))
	for row, line := range lines {
		if line != "" {
			if []rune(line)[0] != '#' {
				kvs := strings.Split(line, "=")
				envName := strings.TrimLeft(kvs[1], "{{")
				envName = strings.TrimRight(envName, "}}")
				lines[row] = fmt.Sprintf(`{{%s_}}%s`, envName, line)
			}
		}
	}
	var newContent string
	for _, c := range lines {
		newContent = newContent + fmt.Sprintln(c)
	}
	ioutil.WriteFile("./test2.sh", []byte(newContent), 0644)
}
