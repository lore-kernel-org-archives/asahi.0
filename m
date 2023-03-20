Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D151399;
	Mon, 20 Mar 2023 09:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1679303951; x=1710839951;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=KcTqCESxcN73NYJ/dcxfK/tm8NaiYnSt/OcyW2m0CDY=;
  b=doZT7lw6b94G81gY/pX6uNG2ryp/Z9B/CtbcSZiErrIex5190syDPwVn
   8vHrwB9jVdZliw5On5VxGFUbji5An1Qpj0K/93metTzLJ6dveuQDyifkn
   Boaf+DIlbfBamwNyNG9/U4cUx7w/vtxSPxWJdIWpmIGHlfkLN7z4/GyDA
   Z+0sl/o6C3Mhaiy+FiMeeM12ATd0KazyjEB4QDfDaBztPGYdn7P/zt4PO
   ky3x6aHMb2AVjMa3mJkFvthDPc5EyXISBoIwU40khHI7tzuZVGh5NeQdg
   yTwLbAq2yfgFADW7Fuq16M8ZmtD6t85mTk2TbgjZkbp5X3FrP4akxoYGj
   A==;
X-IronPort-AV: E=Sophos;i="5.98,274,1673938800"; 
   d="scan'208";a="202463786"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Mar 2023 02:19:05 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 20 Mar 2023 02:19:02 -0700
Received: from [10.159.245.112] (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Mon, 20 Mar 2023 02:18:56 -0700
Message-ID: <b6609e59-0f68-689b-81db-4324ed5deb26@microchip.com>
Date: Mon, 20 Mar 2023 10:18:50 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] dt-bindings: watchdog: Drop unneeded quotes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, "Alyssa
 Rosenzweig" <alyssa@rosenzweig.io>, Julius Werner <jwerner@chromium.org>,
	"Evan Benn" <evanbenn@chromium.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@microchip.com>, Florian Fainelli <f.fainelli@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Kunihiko Hayashi
	<hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: <linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <asahi@lists.linux.dev>,
	<linux-stm32@st-md-mailman.stormreply.com>
References: <20230317233643.3969019-1-robh@kernel.org>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20230317233643.3969019-1-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 18/03/2023 at 00:36, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring<robh@kernel.org>
> ---

[..]

>   .../devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml         | 2 +-

For Microchip platforms:
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Thanks, best regards,
   Nicolas
-- 
Nicolas Ferre

