import React from 'react'

function Footer() {
    return(
    <footer className="footer">
     <nav>
         <ul className="nav-ul">
           <li className="plaidLogo nav-ul__li">
             <img src="/img/plaid-shirt.svg" alt="Plaid Shirt Icon"/>
           </li>
           <p className="plaidPhrase">Plaid Me: A New Set Of Vinatge Fashion!</p>
           <li className="nav-ul__li"><a href="https://twitter.com/?lang=en"> Our Twitter</a></li>
           <li className="nav-ul__li"><a href="https://www.facebook.com/">Our Facebook</a></li>
           <li className="nav-ul__li"><a href="https://www.instagram.com/?hl=en">Our Instagram</a></li>
         </ul>
       </nav>
     </footer>
    )
}

export default Footer