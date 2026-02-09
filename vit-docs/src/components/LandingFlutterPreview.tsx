import React from 'react';
import styles from './LandingFlutterPreview.module.css';

export interface LandingFlutterPreviewProps {
  story: string;
  height?: number;
}

export default function LandingFlutterPreview({ 
  story, 
  height = 500
}: LandingFlutterPreviewProps): JSX.Element {
  return (
    <div className={styles.previewWrapper}>
      <div className={styles.deviceFrame}>
        <div className={styles.deviceNotch}></div>
        <div className={styles.deviceScreen}>
          <iframe
            src={`/flutter-app/index.html?story=${encodeURIComponent(story)}`}
            title={`${story} Preview`}
            className={styles.iframe}
            loading="lazy"
          />
        </div>
      </div>
    </div>
  );
}
