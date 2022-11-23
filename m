Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9D77B
	for <asahi@lists.linux.dev>; Wed, 23 Nov 2022 02:28:44 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id b2so12267092iof.12
        for <asahi@lists.linux.dev>; Tue, 22 Nov 2022 18:28:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zj/cHXoWYv8o+sJtjgpTEuZhl2QFJwpoNEmZc0bJX4o=;
        b=5nsmKsSmoC2RgW/i2ugmEFLxqOCFl3jmQ3dTkc5w6Bo57nCJibN6L8oj2hu4VueC9Y
         k2gX5k0A+xfwvGg2S2FO/reY7vZmhusan7gaL1xLBOuVNnraaNH+1FKPgvPS13uTcR31
         h9HhhZ30CCwm5PEcDq/QfuV6818j0UlHqISN81f/tRxwiom9x04ApawqWHjEB6XYjH71
         QdE70Pw4BpfOB4V9ip7cel4iLzH1k5uDHsIpJzk9uDUh+ptIfb1tCSMT0uCOak4ddrcf
         bvstqFNqOtheN+g8FihvKc61I3se65EDsgQWl0ihw81E7WKTUyCRKq/CGrytoaq+K0Tf
         TJ2g==
X-Gm-Message-State: ANoB5pnaNF7P5iXgS07R0jQofLH5hyUYp9gprhe7dMljFzXlN8K7EKHV
	+CMhFrvyfMVGPhDRifjGSQ==
X-Google-Smtp-Source: AA0mqf5ZqoZAZyZrDERM++koEMloL+V38iwkLLRL0dZkuFkaBLcJ31HFzf+6xYoJWh5V3n3G2HUkzQ==
X-Received: by 2002:a05:6638:440f:b0:375:1820:bb85 with SMTP id bp15-20020a056638440f00b003751820bb85mr11758692jab.46.1669170523964;
        Tue, 22 Nov 2022 18:28:43 -0800 (PST)
Received: from robh_at_kernel.org ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id l18-20020a02a892000000b003636cb862d0sm5949379jam.42.2022.11.22.18.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 18:28:43 -0800 (PST)
Received: (nullmailer pid 1022635 invoked by uid 1000);
	Wed, 23 Nov 2022 02:28:45 -0000
Date: Tue, 22 Nov 2022 20:28:45 -0600
From: Rob Herring <robh@kernel.org>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org, marcan@marcan.st, sven@svenpeter.dev, alyssa@rosenzweig.io, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v3 3/4] arm64: dts: apple: t8103: Add PWM
 controller
Message-ID: <20221123022845.GB1006695-robh@kernel.org>
References: <20221121174228.93670-1-fnkl.kernel@gmail.com>
 <20221121174228.93670-4-fnkl.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221121174228.93670-4-fnkl.kernel@gmail.com>

On Mon, Nov 21, 2022 at 08:42:27PM +0300, Sasha Finkelstein wrote:
> Adds PWM controller and keyboard backlight bindings for M1 MacBooks
> 
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> Acked-by: Sven Peter <sven@svenpeter.dev>
> ---
>  arch/arm64/boot/dts/apple/t8103-j293.dts | 20 ++++++++++++++++++++
>  arch/arm64/boot/dts/apple/t8103-j313.dts | 20 ++++++++++++++++++++
>  arch/arm64/boot/dts/apple/t8103.dtsi     |  9 +++++++++
>  3 files changed, 49 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/dts/apple/t8103-j293.dts
> index ecb10d237a05..0b4b7e8e0726 100644
> --- a/arch/arm64/boot/dts/apple/t8103-j293.dts
> +++ b/arch/arm64/boot/dts/apple/t8103-j293.dts
> @@ -11,6 +11,7 @@
>  
>  #include "t8103.dtsi"
>  #include "t8103-jxxx.dtsi"
> +#include <dt-bindings/leds/common.h>
>  
>  / {
>  	compatible = "apple,j293", "apple,t8103", "apple,arm-platform";
> @@ -43,3 +44,22 @@ &i2c2 {
>  &i2c4 {
>  	status = "okay";
>  };
> +
> +/ {
> +	led-controller {
> +		compatible = "pwm-leds";
> +		led-0 {
> +			pwms = <&fpwm1 0 40000>;
> +			pwm-names = "kbd-backlight";

While allowed pwm-names isn't really needed here as there is only ever 1 
PWM and it is redundant with 'label'.

> +			label = "kbd_backlight";
> +			function = LED_FUNCTION_KBD_BACKLIGHT;
> +			color = <LED_COLOR_ID_WHITE>;
> +			max-brightness = <255>;
> +			default-state = "keep";
> +		};
> +	};
> +};
> +
> +&fpwm1 {
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/apple/t8103-j313.dts b/arch/arm64/boot/dts/apple/t8103-j313.dts
> index df741737b8e6..0e0f57dee96b 100644
> --- a/arch/arm64/boot/dts/apple/t8103-j313.dts
> +++ b/arch/arm64/boot/dts/apple/t8103-j313.dts
> @@ -11,6 +11,7 @@
>  
>  #include "t8103.dtsi"
>  #include "t8103-jxxx.dtsi"
> +#include <dt-bindings/leds/common.h>
>  
>  / {
>  	compatible = "apple,j313", "apple,t8103", "apple,arm-platform";
> @@ -35,3 +36,22 @@ &pcie0_dart_2 {
>  
>  /delete-node/ &port01;
>  /delete-node/ &port02;
> +
> +/ {
> +	led-controller {
> +		compatible = "pwm-leds";
> +		led-0 {
> +			pwms = <&fpwm1 0 40000>;
> +			pwm-names = "kbd-backlight";
> +			label = "kbd_backlight";
> +			function = LED_FUNCTION_KBD_BACKLIGHT;
> +			color = <LED_COLOR_ID_WHITE>;
> +			max-brightness = <255>;
> +			default-state = "keep";
> +		};
> +	};
> +};
> +
> +&fpwm1 {
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
> index 51a63b29d404..ccdb26ef6b22 100644
> --- a/arch/arm64/boot/dts/apple/t8103.dtsi
> +++ b/arch/arm64/boot/dts/apple/t8103.dtsi
> @@ -191,6 +191,15 @@ i2c4: i2c@235020000 {
>  			status = "disabled"; /* only used in J293 */
>  		};
>  
> +		fpwm1: pwm@235044000 {
> +			compatible = "apple,t8103-fpwm", "apple,s5l-fpwm";
> +			reg = <0x2 0x35044000 0x0 0x4000>;
> +			power-domains = <&ps_fpwm1>;
> +			clocks = <&clkref>;
> +			#pwm-cells = <2>;
> +			status = "disabled";
> +		};
> +
>  		serial0: serial@235200000 {
>  			compatible = "apple,s5l-uart";
>  			reg = <0x2 0x35200000 0x0 0x1000>;
> -- 
> 2.38.1
> 
> 
