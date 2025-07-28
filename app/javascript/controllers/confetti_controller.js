import { Controller } from "@hotwired/stimulus"
import confetti from "canvas-confetti"

export default class extends Controller {
  connect() {
    this.confetti = confetti

    this.observer = new IntersectionObserver((entries) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          this.celebrate()
        }
      })
    }, {
      threshold: 1.0,
      rootMargin: '-10% 0px'
    })

    this.observer.observe(this.element)
  }

  disconnect() {
    this.observer.disconnect()
    this.confetti.reset()
  }

  celebrate() {
    const { x, y } = this.getElementCenter(this.element)
    this.fireConfetti(x, y)
  }

  getElementCenter(element) {
    const rect = element.getBoundingClientRect()
    return {
      x: (rect.left + rect.width / 2) / window.innerWidth,
      y: (rect.top + rect.height / 2) / window.innerHeight
    }
  }

  fireConfetti(x, y) {
    this.confetti({
      particleCount: 100,
      angle: 135,
      spread: 45,
      origin: { x, y },
      colors: ['#0055A4']
    })

    this.confetti({
      particleCount: 100,
      angle: 90,
      spread: 70,
      origin: { x, y },
      colors: ['#FFFFFF']
    })

    this.confetti({
      particleCount: 100,
      angle: 45,
      spread: 45,
      origin: { x, y },
      colors: ['#EF4135']
    })
  }
}
