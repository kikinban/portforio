class PortforioController < ApplicationController
  def top
    @months_2020 = ["10月","11月","12月"]
    @months_2021 = ["1月","2月","3月","4月","5月","6月"]
    @year_2020 = 2020
    @year_2021 = 2021
  end
  def profile
  end
  def report
    @months_2020 = ["10月","11月","12月"]
    @months_2021 = ["1月","2月","3月","4月","5月","6月"]
    @year_2020 = 2020
    @year_2021 = 2021
  end
  def work
  end
  def contact
  end

  
end
