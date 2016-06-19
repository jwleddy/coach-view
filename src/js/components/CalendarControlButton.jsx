import React from 'react'
import classNames from 'classnames'

export default class CalendarControlButton extends React.Component {
  render() {

    return(
      <div
        className={this.props.className}
        onClick={this.props.toggleEvents}
      >{this.props.children}
      </div>
    )
  }
}
