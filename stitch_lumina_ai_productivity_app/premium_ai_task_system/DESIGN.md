---
name: Premium AI Task System
colors:
  surface: '#f9f9f7'
  surface-dim: '#d9dad8'
  surface-bright: '#f9f9f7'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#f3f4f2'
  surface-container: '#edeeec'
  surface-container-high: '#e8e8e6'
  surface-container-highest: '#e2e3e1'
  on-surface: '#1a1c1b'
  on-surface-variant: '#404846'
  inverse-surface: '#2f3130'
  inverse-on-surface: '#f0f1ef'
  outline: '#717976'
  outline-variant: '#c0c8c5'
  surface-tint: '#3a665d'
  primary: '#002620'
  on-primary: '#ffffff'
  primary-container: '#0d3d35'
  on-primary-container: '#7ba89d'
  inverse-primary: '#a2d0c4'
  secondary: '#35675d'
  on-secondary: '#ffffff'
  secondary-container: '#b6eadd'
  on-secondary-container: '#3a6b61'
  tertiary: '#142421'
  on-tertiary: '#ffffff'
  tertiary-container: '#293937'
  on-tertiary-container: '#91a29f'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#bdece0'
  primary-fixed-dim: '#a2d0c4'
  on-primary-fixed: '#00201b'
  on-primary-fixed-variant: '#224e46'
  secondary-fixed: '#b9ede0'
  secondary-fixed-dim: '#9dd1c4'
  on-secondary-fixed: '#00201b'
  on-secondary-fixed-variant: '#1b4f46'
  tertiary-fixed: '#d4e6e2'
  tertiary-fixed-dim: '#b8cac6'
  on-tertiary-fixed: '#0f1e1c'
  on-tertiary-fixed-variant: '#3a4a47'
  background: '#f9f9f7'
  on-background: '#1a1c1b'
  surface-variant: '#e2e3e1'
typography:
  display-lg:
    fontFamily: Hanken Grotesk
    fontSize: 34px
    fontWeight: '700'
    lineHeight: 42px
    letterSpacing: -0.02em
  headline-md:
    fontFamily: Hanken Grotesk
    fontSize: 22px
    fontWeight: '600'
    lineHeight: 28px
    letterSpacing: -0.01em
  headline-sm:
    fontFamily: Hanken Grotesk
    fontSize: 18px
    fontWeight: '600'
    lineHeight: 24px
  body-lg:
    fontFamily: Hanken Grotesk
    fontSize: 16px
    fontWeight: '400'
    lineHeight: 24px
  body-md:
    fontFamily: Hanken Grotesk
    fontSize: 14px
    fontWeight: '400'
    lineHeight: 20px
  label-caps:
    fontFamily: Hanken Grotesk
    fontSize: 12px
    fontWeight: '600'
    lineHeight: 16px
    letterSpacing: 0.05em
  headline-lg-mobile:
    fontFamily: Hanken Grotesk
    fontSize: 28px
    fontWeight: '700'
    lineHeight: 34px
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.75rem
  lg: 1rem
  xl: 1.5rem
  full: 9999px
spacing:
  base: 4px
  container-padding: 24px
  card-gap: 16px
  section-margin: 40px
  gutter: 16px
---

## Brand & Style

This design system is built on the pillars of **Minimalism** and **Luxury**, heavily influenced by Apple’s design language. It is crafted for high-performing individuals who require a workspace that feels calm, organized, and sophisticated. 

The aesthetic is characterized by extreme clarity, "floating" UI elements, and a deep, forest-inspired palette that conveys growth and professional stability. The interface relies on generous white space and subtle depth cues rather than complex decorative elements, ensuring that the user’s focus remains entirely on their productivity and AI-assisted workflows. The emotional response is one of "ordered tranquility"—a digital environment that reduces cognitive load through structured simplicity.

## Colors

The palette is anchored by a sophisticated **Dark Green (#0D3D35)**, used for primary actions and brand presence to evoke a sense of premium quality and focus. This is supported by a slightly lighter accent green for hover states and secondary depth.

- **Surface Strategy:** The background is a very soft off-white (#F8F8F8), while interactive "floating" cards utilize pure White (#FFFFFF) to create immediate visual separation.
- **Accents:** A Light Green (#DCEEEA) serves as a subtle background for chips or low-priority containers, maintaining the monochromatic forest theme.
- **Functional Colors:** High-priority indicators use a desaturated red, and medium-priority uses a muted gold, both calibrated to sit harmoniously within the deep green environment without appearing jarring.

## Typography

Using **Hanken Grotesk**, the typography mirrors the clean, geometric precision of SF Pro while offering a unique contemporary edge. 

- **Titles:** Use bold weights (700) with slight negative letter-spacing to achieve that "luxury editorial" look found in premium hardware marketing.
- **Body:** Regular weight (400) provides maximum legibility for task descriptions and AI-generated insights.
- **Hierarchy:** Dramatic contrast between headlines and body text is preferred over many intermediate sizes. Information density is kept low to maintain the premium, spacious feel.

## Layout & Spacing

The layout follows a **Fixed Grid** philosophy for desktop (centering content at 1200px) and a fluid 4-column system for mobile. 

- **Rhythm:** A 4px baseline grid ensures consistent alignment.
- **Safe Zones:** Use 24px margins on mobile to provide enough "breathable" space for the floating cards to appear light and unconfined. 
- **AI Sidebar:** On desktop, a persistent right-hand AI workspace occupies 30% of the screen width, while the primary task management occupies the remaining 70%.

## Elevation & Depth

This design system uses **Ambient Shadows** and **Tonal Layers** to create a sense of physical layering without clutter.

- **Floating Cards:** Use a dual-shadow approach: a very soft, wide-spread shadow (30px blur, 4% opacity) and a tighter, closer shadow (4px blur, 2% opacity). Both shadows should be tinted with the Primary Dark Green (#0D3D35) to ground the elements.
- **Z-Axis:**
  - `Level 0`: Background (#F8F8F8).
  - `Level 1`: Content Cards (White, soft shadow).
  - `Level 2`: Modals, Popovers, and AI Tooltips (White, more pronounced shadow).
- **Glassmorphism:** Use subtle backdrop blurs (20px) behind navigation bars to maintain context as the user scrolls through task lists.

## Shapes

The shape language is defined by high-radius curves that feel organic and friendly.

- **Cards:** Uniform 20px corner radius across all primary containers.
- **Interactive Elements:** Buttons and tags must be "Pill-shaped" (circular ends) to contrast against the rectangular cards.
- **Inputs:** Use the `rounded-lg` (16px) setting to maintain a softer look than standard enterprise software.

## Components

- **Buttons:** Primary CTAs are pill-shaped, filled with Dark Green (#0D3D35), and use white typography. Secondary buttons use the Light Green (#DCEEEA) background with Dark Green text.
- **Floating Cards:** White background with a 1px soft border (#EEEEEE) and the signature Apple-style ambient shadow.
- **Chips/Tags:** Used for "Priority" and "Category". These should have a subtle background fill and no border, with a 500px radius.
- **Input Fields:** Minimalist design with a subtle 1px border that becomes Dark Green on focus. Labels should be small and positioned above the field.
- **Icons:** Exclusively use Lucide-style 2pt stroke icons. Icons are never filled unless they represent an active "selected" state in the navigation bar.
- **AI Elements:** AI-driven suggestions are encased in a subtle gradient border (transitioning from Dark Green to Light Green) to distinguish them from manual tasks.