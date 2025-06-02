import React from 'react'
import { createRoot } from 'react-dom/client'

const Hello = props => (
    <div>Hello {props.name}, from React code!</div>
)
Hello.defaultProps = {
    name: 'World'
}
document.addEventListener('DOMContentLoaded', () => {
    const domNode = document.getElementById('root');
    const root = createRoot(domNode);
    root.render(
        <Hello name="Jake" />
    );
})