require 'pry'

class Doctor

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def appointments
    Appointment.all.select {|appointment| appointment.doctor == self}
  end

  def new_appointment(patient, date)
    #binding.pry
    Appointment.new(date, patient, self)
  end

  def patients
    Appointment.all.map do |appointment|
      if appointment.doctor == self
        appointment.patient
      end
    end
  end


end