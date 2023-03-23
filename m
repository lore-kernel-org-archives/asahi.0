Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA46033E3
	for <asahi@lists.linux.dev>; Thu, 23 Mar 2023 09:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1679565119; x=1711101119;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=c5AVjfNTyn5jyoWxBV5nksKULO7WagsKTvP/gGAu+pY=;
  b=kXQqiWVPnjLB84PzKIO7oeWcapHcxU5wuFIi33RYVdQ7miFOy5xUsWnO
   Q57aWA7G1LYUqaLwkWHxdrcOdPOD7fcQEjMAk032o1F9WrRFCDsXPHq2T
   pyB5zZ3lmmA5MCBk3fvdel10GKRC3cTuP+C2vPVSO5PtCPN8zNs5LQlP3
   PTd4+rQZZtae5uZ2AE4dNairsNaOLLNXaHfDAnrSbGHY3nRqGy+NCOFjZ
   e0queLPuPZ8fezdpwiiNc0OLA89w0EJzzGdHSSCQbUMs1l3fQKz56gpYD
   8o04l7F3C76ebXECOCn2qaByLqlnN8cN/H02hrrOuheXjJrtUhdK++2AT
   A==;
X-IronPort-AV: E=Sophos;i="5.98,283,1673938800"; 
   d="scan'208";a="203041791"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 23 Mar 2023 02:51:40 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 23 Mar 2023 02:51:37 -0700
Received: from [10.12.67.87] (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Thu, 23 Mar 2023 02:51:33 -0700
Message-ID: <429849c0-1be3-2fc9-185c-9b5630304b13@microchip.com>
Date: Thu, 23 Mar 2023 10:51:32 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] dt-bindings: i2c: Drop unneeded quotes
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, "Jerome
 Brunet" <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Hector Martin <marcan@marcan.st>, "Sven
 Peter" <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@microchip.com>, Michal Simek <michal.simek@xilinx.com>,
	"Peter Rosin" <peda@axentia.se>, Andy Gross <agross@kernel.org>, Bjorn
 Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
	"Maxime Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <asahi@lists.linux.dev>,
	<linux-arm-msm@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>
References: <20230322173530.3971676-1-robh@kernel.org>
Content-Language: en-US
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20230322173530.3971676-1-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 22/03/2023 at 18:35, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring<robh@kernel.org>
> ---

[..]

>   Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml  | 2 +-

for Microchip:
Reviewed-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Thanks Rob, best regards,
   Nicolas

-- 
Nicolas Ferre

