// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "trix"
import "@rails/actiontext"
import "@hotwired/turbo-rails"

// import LocalTime from "./i18n/localTimeFR"
import LocalTime from "local-time"

LocalTime.config.i18n["fr"] = {
  date: {
    dayNames: [
      "Dimanche",
      "Lundi",
      "Mardi",
      "Mercredi",
      "Jeudi",
      "Vendredi",
      "Samedi"
    ],
    monthNames: [
      "Janvier",
      "Fevrier",
      "Mars",
      "Avril",
      "Mai",
      "Juin",
      "Juillet",
      "Aout",
      "Septembre",
      "Octobre",
      "Novembre",
      "Décembre"
    ],
    abbrMonthNames: [
      "Janvier",
      "Fevrier",
      "Mars",
      "Avril",
      "Mai",
      "Juin",
      "Juillet",
      "Aout",
      "Septembre",
      "Octobre",
      "Novembre",
      "Décembre"
    ],
    yesterday: "hier",
    today: "aujourd'hui",
    tomorrow: "demain",
    on: "le {date}",
    formats: {
      default: "%e %b, %Y",
      thisYear: "%e %b"
    }

  },
  time: {
    am: "",
    pm: "",
    singular: "une {time}",
    singularAn: "une {time}",
    elapsed: "il y a {time}",
    second: "seconde",
    seconds: "secondes",
    minute: "minute",
    minutes: "minutes",
    hour: "heure",
    hours: "heures"
  },
  datetime: {
    at: "{date} à {time}"
  }
}

LocalTime.config.locale = "fr"

LocalTime.start()