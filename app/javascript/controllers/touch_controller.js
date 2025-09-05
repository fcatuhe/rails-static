import { Controller } from "@hotwired/stimulus"

const SWIPE_DURATION = 1000
const SWIPE_THRESHOLD = 30

export default class extends Controller {
  connect() {
    this.element.addEventListener("touchstart", this.#handleTouchStart.bind(this), false)
    this.element.addEventListener("touchend", this.#handleTouchEnd.bind(this), false)
  }

  #handleTouchStart(event) {
    this.startX = event.touches[0].clientX
    this.startY = event.touches[0].clientY
    this.startTime = new Date().getTime()
  }

  #handleTouchEnd(event) {
    this.endTime = new Date().getTime()

    if (this.#isSelection || this.#exceedsDuration) return

    const endX = event.changedTouches[0].clientX
    const endY = event.changedTouches[0].clientY
    const deltaX = Math.abs(endX - this.startX)
    const deltaY = Math.abs(endY - this.startY)

    if (deltaX > SWIPE_THRESHOLD && deltaY < SWIPE_THRESHOLD) {
      if (this.startX > endX) {
        this.#swipedRight()
      } else {
        this.#swipedLeft()
      }
    }
  }

  #swipedLeft() {
    this.dispatch("swipe-left")
  }

  #swipedRight() {
    this.dispatch("swipe-right")
  }

  get #exceedsDuration() {
    const duration = this.endTime - this.startTime
    return duration > SWIPE_DURATION
  }

  get #isSelection() {
    const selection = window.getSelection()
    return selection.toString().length > 0 && !selection.isCollapsed
  }
}
