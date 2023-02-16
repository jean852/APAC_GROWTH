import React from 'react';
import './MaterialButton.scss';
import { makeStyles } from '@material-ui/core/styles';
import Button from '@material-ui/core/Button';

const useStyles = makeStyles((theme) => ({
  button: {
    margin: theme.spacing(1),
  },
}));

const MaterialButton = () => {
  const classes = useStyles();

  return (
    <Button variant="contained" color="primary" className={classes.button}>
      Click Me!
    </Button>
  );
};

export default MaterialButton;
