extends Node


class Flags:
	signal changed
	var flags := []
	
	func has(flag: String):  #检查是否有flag
		return flag in flags
	
	func add(flag: String):  #添加flag
		if flag in flags: return
		
		flags.append(flag)
		changed.emit()


var flags := Flags.new()  #创建实例
