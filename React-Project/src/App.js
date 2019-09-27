import React from "react";
import { BrowserRouter, Switch, Route } from "react-router-dom";
import Nav from "./Components/Nav/Nav";
import Home from "./Components/Home/Home";
import Products from "./Components/Products/Products";
import Contact from "./Components/Contact/Contact";
import Footer from "./Components/Footer/Footer";
import "./SCSS/App.scss";

class App extends React.Component {
  state = {
    products: [],
    filteredProducts: [],
    images: [
      "/img/fashionWeek.jpg",
      "/img/modelsWeek.jpg",
      "/img/plaidWeek.jpg",
      "/img/versaceWeek.jpg"
    ],
    currentIndex: 0
  };

  componentDidMount(){
    fetch("/products")
      .then(response => response.json())
      .then(response => this.setState({products: response}));
  }
  //   slider
  goToPrevSlide = () => {
    if (this.state.currentIndex === 0) return;

    this.setState({
      currentIndex: this.state.currentIndex - 1
    });
  };

  goToNextSlide = () => {
    console.log(this.state.currentIndex);
    if (this.state.currentIndex === this.state.images.length - 1) {
      return this.setState({
        currentIndex: 0
      });
    }

    this.setState({
      currentIndex: this.state.currentIndex + 1
    });
  };
  //   filter
  filterProducts = event => {
    let products = [...this.state.products];
    const filterType = document.querySelector(".filterType").value;
    const filterPrice = document.querySelector(".filterPrice").value;

    if (filterType !== "none") {
      products = products.filter(product => product.filterType === filterType);
    }

    if (filterPrice !== "none") {
      if (filterPrice === "low") {
        products.sort(
          (firstProduct, secondProduct) =>
            Number(firstProduct.price) - Number(secondProduct.price)
        );
      } else if (filterPrice === "high") {
        products.sort(
          (firstProduct, secondProduct) =>
            Number(secondProduct.price) - Number(firstProduct.price)
        );
      }
    }
    this.setState({
      filteredProducts: products
    });
  };

  render() {
    return (
      <BrowserRouter>
        <Nav />
        <Switch>
          <Route
            exact
            path="/"
            render={() => (
              <Home
                images={this.state.images}
                currentIndex={this.state.currentIndex}
                goToNextSlide={this.goToNextSlide}
                goToPrevSlide={this.goToPrevSlide}
              />
            )}
          />
          <Route
            path="/products"
            render={() => (
              <Products
                products={this.state.products}
                filterProductsFunc={this.filterProducts}
                filteredProducts={this.state.filteredProducts}
              />
            )}
          />
          <Route path="/contact" component={Contact} />
        </Switch>
        <Footer />
      </BrowserRouter>
    );
  }
}

export default App;
