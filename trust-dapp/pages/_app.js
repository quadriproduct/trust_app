import '../styles/globals.css'
import Navbar from '../navbar/navbar'

function MyApp({ Component, pageProps }) {
  return (<>
  <Navbar/>
  <Component {...pageProps} />
  </>
  )
}

export default MyApp
