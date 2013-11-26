#!/usr/bin/ruby
require 'mysql'
require 'json'

module MysqlDal

	def self.fetchHourlyDeatilsByDay(year,month,day) 
		begin
			currentHour = -1
		    con = Mysql.new 'localhost', 'user12', '34klq*'
		    rs = con.query sprintf("CALL mydb.fetchHourlyDeatilsByDay(%s,%s,%s);",year.to_s,month.to_s,day.to_s)
			hourReportHash = Hash.new
								
			rs.each_hash do |row|
					if(currentHour != row['Hour'].to_i)
						currentHour = row['Hour'].to_i
						hourReportHash[currentHour] = Hash.new
					end
						hourReportHash[currentHour][row['System']] = row['Weight']
			end

			hourReportHash.to_json

		rescue Mysql::Error => e
		    puts e.errno
		    puts e.error
		    
		ensure
		    con.close if con
		end
	end

end

