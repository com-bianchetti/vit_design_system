import type {ReactNode} from 'react';
import Link from '@docusaurus/Link';
import useDocusaurusContext from '@docusaurus/useDocusaurusContext';
import Layout from '@theme/Layout';
import styles from './index.module.css';
import LandingFlutterPreview from '@site/src/components/LandingFlutterPreview';

export default function Home(): ReactNode {
  const {siteConfig} = useDocusaurusContext();
  
  return (
    <Layout
      title="Vit Design System - Flutter UI Component Library"
      description="Beautiful, customizable Flutter components. Build faster with 30+ ready-to-use components, powerful theming, and form management.">
      
      <main className={styles.main}>
        <section className={styles.hero}>
          <div className={styles.heroContent}>
            <div className={styles.heroText}>
              <span className={styles.label}>FLUTTER UI LIBRARY</span>
              <h1 className={styles.heroTitle}>
                Beautiful design.
                <br />
                Unlimited possibilities.
              </h1>
              <p className={styles.heroSubtitle}>
                Build Flutter apps faster with a comprehensive library of 30+ customizable components.
                Beautiful by default. Powerful theming. Form management included.
              </p>
              <div className={styles.heroButtons}>
                <Link
                  className={styles.primaryButton}
                  to="/docs/intro">
                  Get Started
                </Link>
                <Link
                  className={styles.secondaryButton}
                  to="/docs/components/button">
                  View Components
                </Link>
              </div>
            </div>
            
            <div className={styles.heroVisual}>
              <div className={styles.componentGrid}>
                <div className={styles.gridItem}>Button</div>
                <div className={styles.gridItem}>Form Fields</div>
                <div className={styles.gridItem}>Cards</div>
                <div className={styles.gridItem}>Modals</div>
                <div className={styles.gridItem}>Toast</div>
                <div className={styles.gridItem}>Layout</div>
              </div>
            </div>
          </div>
        </section>

        <section className={styles.stats}>
          <div className={styles.container}>
            <div className={styles.statsGrid}>
              <div className={styles.statItem}>
                <div className={styles.statNumber}>30+</div>
                <div className={styles.statLabel}>Components</div>
              </div>
              <div className={styles.statItem}>
                <div className={styles.statNumber}>15+</div>
                <div className={styles.statLabel}>Form Fields</div>
              </div>
              <div className={styles.statItem}>
                <div className={styles.statNumber}>100%</div>
                <div className={styles.statLabel}>Customizable</div>
              </div>
              <div className={styles.statItem}>
                <div className={styles.statNumber}>0</div>
                <div className={styles.statLabel}>JS Dependencies</div>
              </div>
            </div>
          </div>
        </section>

        <section className={styles.features}>
          <div className={styles.container}>
            <h2 className={styles.sectionTitle}>Why Vit Design System?</h2>
            
            <div className={styles.featureGrid}>
              <div className={styles.feature}>
                <div className={styles.featureIcon}>⚡</div>
                <h3>Faster Development</h3>
                <p>Pre-built components save hours of development time. Focus on your app logic, not UI boilerplate.</p>
              </div>
              
              <div className={styles.feature}>
                <div className={styles.featureIcon}>🎨</div>
                <h3>Powerful Theming</h3>
                <p>Customize every aspect of your design. Dark mode built-in. Create unique themes effortlessly.</p>
              </div>
              
              <div className={styles.feature}>
                <div className={styles.featureIcon}>📝</div>
                <h3>Form Management</h3>
                <p>Complex forms made simple. Multi-page forms, validation, and 15+ specialized field types included.</p>
              </div>
              
              <div className={styles.feature}>
                <div className={styles.featureIcon}>🌍</div>
                <h3>i18n Ready</h3>
                <p>Built-in internationalization support. Easily translate your app into multiple languages.</p>
              </div>
              
              <div className={styles.feature}>
                <div className={styles.featureIcon}>♿</div>
                <h3>Accessible</h3>
                <p>WCAG compliant components. Semantic HTML and proper ARIA labels out of the box.</p>
              </div>
              
              <div className={styles.feature}>
                <div className={styles.featureIcon}>🎯</div>
                <h3>Type Safe</h3>
                <p>Full Dart type safety. Comprehensive documentation. Fewer bugs, better developer experience.</p>
              </div>
            </div>
          </div>
        </section>

        <section className={styles.showcase}>
          <div className={styles.container}>
            <h2 className={styles.sectionTitle}>Interactive Components</h2>
            <p className={styles.sectionSubtitle}>
              Try our components live. Click, tap, and interact with real Flutter widgets.
            </p>
            
            <div className={styles.showcaseGrid}>
              <div className={styles.showcaseItem}>
                <h3>Buttons</h3>
                <LandingFlutterPreview story="button" />
                <p className={styles.showcaseDescription}>
                  Primary, secondary, outlined, and icon buttons with loading states.
                </p>
              </div>
              
              <div className={styles.showcaseItem}>
                <h3>Form Fields</h3>
                <LandingFlutterPreview story="input" />
                <p className={styles.showcaseDescription}>
                  Email, password, phone, and 15+ specialized validated fields.
                </p>
              </div>
              
              <div className={styles.showcaseItem}>
                <h3>Cards</h3>
                <LandingFlutterPreview story="card" />
                <p className={styles.showcaseDescription}>
                  Beautiful card layouts for displaying content and actions.
                </p>
              </div>
            </div>
          </div>
        </section>

        <section className={styles.components}>
          <div className={styles.container}>
            <h2 className={styles.sectionTitle}>30+ Components</h2>
            <p className={styles.sectionSubtitle}>
              Everything you need to build modern Flutter applications
            </p>
            
            <div className={styles.componentList}>
              <div className={styles.componentCategory}>
                <h4>Actions</h4>
                <ul>
                  <li><Link to="/docs/components/button">Button</Link></li>
                  <li><Link to="/docs/components/modal">Modal</Link></li>
                  <li><Link to="/docs/components/dialog">Dialog</Link></li>
                  <li><Link to="/docs/components/sheet">Sheet</Link></li>
                </ul>
              </div>
              
              <div className={styles.componentCategory}>
                <h4>Data Display</h4>
                <ul>
                  <li><Link to="/docs/components/card">Card</Link></li>
                  <li><Link to="/docs/components/avatar">Avatar</Link></li>
                  <li><Link to="/docs/components/badge">Badge</Link></li>
                  <li><Link to="/docs/components/chip">Chip</Link></li>
                  <li><Link to="/docs/components/accordion">Accordion</Link></li>
                </ul>
              </div>
              
              <div className={styles.componentCategory}>
                <h4>Form Inputs</h4>
                <ul>
                  <li><Link to="/docs/components/input">Input</Link></li>
                  <li><Link to="/docs/components/select">Select</Link></li>
                  <li><Link to="/docs/components/checkbox">Checkbox</Link></li>
                  <li><Link to="/docs/components/radio">Radio</Link></li>
                  <li><Link to="/docs/components/slider">Slider</Link></li>
                  <li><Link to="/docs/components/switch">Switch</Link></li>
                </ul>
              </div>
              
              <div className={styles.componentCategory}>
                <h4>Feedback</h4>
                <ul>
                  <li><Link to="/docs/components/toast">Toast</Link></li>
                  <li><Link to="/docs/components/loading">Loading</Link></li>
                  <li><Link to="/docs/components/progress">Progress</Link></li>
                  <li><Link to="/docs/components/skeleton">Skeleton</Link></li>
                </ul>
              </div>
              
              <div className={styles.componentCategory}>
                <h4>Layout</h4>
                <ul>
                  <li><Link to="/docs/components/layout">Layout</Link></li>
                  <li><Link to="/docs/components/scaffold">Scaffold</Link></li>
                  <li><Link to="/docs/components/appbar">AppBar</Link></li>
                  <li><Link to="/docs/components/bottom-bar">Bottom Bar</Link></li>
                </ul>
              </div>
              
              <div className={styles.componentCategory}>
                <h4>Specialized Fields</h4>
                <ul>
                  <li><Link to="/docs/components/fields">Email Field</Link></li>
                  <li><Link to="/docs/components/fields">Password Field</Link></li>
                  <li><Link to="/docs/components/fields">Phone Field</Link></li>
                  <li><Link to="/docs/components/fields">Currency Field</Link></li>
                  <li><Link to="/docs/components/fields">+11 more...</Link></li>
                </ul>
              </div>
            </div>
          </div>
        </section>

        <section className={styles.codeExample}>
          <div className={styles.container}>
            <h2 className={styles.sectionTitle}>Simple, Clean Code</h2>
            <p className={styles.sectionSubtitle}>
              Write less code. Build more features. Focus on what matters.
            </p>
            
            <div className={styles.codeComparison}>
              <div className={styles.codeBlock}>
                <div className={styles.codeBlockHeader}>
                  <span className={styles.codeBlockLabel}>Without Vit</span>
                </div>
                <pre className={styles.codeBlockContent}>
{`Container(
  padding: EdgeInsets.all(16),
  decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(8),
  ),
  child: Text(
    'Click me',
    style: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
  ),
)`}
                </pre>
              </div>
              
              <div className={styles.codeBlock}>
                <div className={styles.codeBlockHeader}>
                  <span className={styles.codeBlockLabel}>With Vit</span>
                </div>
                <pre className={styles.codeBlockContent}>
{`VitButton(
  text: 'Click me',
  onPressed: () {},
)`}
                </pre>
              </div>
            </div>
          </div>
        </section>

        <section className={styles.cta}>
          <div className={styles.container}>
            <h2 className={styles.ctaTitle}>Start building beautiful Flutter apps today</h2>
            <p className={styles.ctaSubtitle}>
              Install Vit Design System and ship your app faster
            </p>
            
            <div className={styles.installBox}>
              <code>flutter pub add vit_design_system</code>
            </div>
            
            <div className={styles.ctaButtons}>
              <Link
                className={styles.primaryButton}
                to="/docs/intro">
                Get Started
              </Link>
              <Link
                className={styles.secondaryButton}
                to="/docs/components/button">
                Browse Components
              </Link>
            </div>
          </div>
        </section>
      </main>
    </Layout>
  );
}
