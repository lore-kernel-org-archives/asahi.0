Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2A27C
	for <asahi@lists.linux.dev>; Sun, 19 Mar 2023 21:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1679261838; x=1710797838;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=TT1NZFDlglG04lWn8b3D569FNDwhCTSHE8VYkA5Dx+U=;
  b=COdEtaLymdQyro3xoDyd+3XLc8WkZt9LV4QX5D1MTUNjGBy9l4I1zdJc
   t11CU5YyxL5Gi5QS7Zi3V/9sSdSasdzjjxwb8qeGGXzdxHPnOsY1hrvDU
   QhXdxsFj0ZKGgFaYlUJbK6sK/moNuJUbiJ+8ZZhfj/oWQPXWbs3dVABss
   +0fEypTjpsMVJL1gii6qVbxFiU8MIXQce9YK4OB5A/G7feAtmwtn5FT/Z
   WJjbcq/Y+9mQnyE2BiYaOdBjmWJANVhFpMN5/J5R9wjRWvHtuJnycl3Vj
   yw1HSSiUmwvhXRuIXNU1o/bUPHODEqfVvfFXHhUQlrx6r+Ra2OvlPee0o
   g==;
X-IronPort-AV: E=Sophos;i="5.98,274,1673884800"; 
   d="scan'208";a="330394013"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 20 Mar 2023 05:36:08 +0800
IronPort-SDR: 3sseW0QsbMGi4yDvNVNtF0JW7POFO8K5S36qmrMaP6MPbJR3vl6HG4sxZlcS8vY0eoqVNhpA5H
 eCdZsx3Bt9vB6SSCxPVY1oh4kymtht916fpFcYClJt2cc3UmZfS1JrmPcVM6Y035bDuShFq/jj
 sN1q36wvW1GOpuQ9y3bRIixZeo8owVryQH4Jj6YK4vsIYTjiaFtm39vbGZBnQ8Q+WYHiRTKyho
 ncnB/3RBlPBBo+2wluQlTyKKtAZOF3iv3JCYXqtGyjrinanj4U1uOnQTFGNUfdjZpzQpGVadDl
 5cQ=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Mar 2023 13:46:48 -0700
IronPort-SDR: b+7DXEDsF4Hs62MD68KHAAdQ0SbLOyLMVigcQQyuFvXHqiWoELC4i91iaTlv94XOHb+6NsyCBx
 Y6dUQKujsSBGs7SOrV1hdLRkaliOJtKWpJgpuA9rsdbvmkXbGzK6/A8p1bTuazy1tj5tnzgL1K
 Yb+t+VtZpuqqrJH97jDfPw2F1E0j1QgpS+5oX3bUhzw7VhjAif5IVESApZC8vQZTAASqLqjt5c
 7aD4HdiYmZV68TZ+PVCRyakoQhIgog5cgkGxd7Q+14icz8f6y2tYR5gA3iFkX6KtwMc4Uy+P9B
 emw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Mar 2023 14:36:09 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4PfrlW5z6dz1RtW6
	for <asahi@lists.linux.dev>; Sun, 19 Mar 2023 14:36:07 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:content-language:references:to
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1679261766; x=1681853767; bh=TT1NZFDlglG04lWn8b3D569FNDwhCTSHE8V
	YkA5Dx+U=; b=d2D4DjWtPSFjUXyC0U3hXSz1FizGwXsTTM0r4dHYMeawKj8v6Xj
	2t1mdjZ3aFxGfrCNx2Q5l6S55yrTI2th8NgunrJcxGCLNO3nOcST/AlKeQN7sDgr
	1uzLlj4W8+zo05uqVTKJKxdARYDcx4TzTnRqD/79Vu58OTkCm94mgecAWrHv3drh
	urfcpgvwa3dedmDHWC6IJBtGOyjEeocE3i9n1T/9H3HG4z72LKSNLSqWLTt4S5ib
	Ikj07Rb7kaLcaMwIFP/RvG9BqShyPIqRE1pgSu2gK3b6+6VqAOptmu7EYJrtw6KM
	KJgylZmpTFw9/IxRkVwxupQkVUT722u5oQQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id yJrW3t-ZsnNY for <asahi@lists.linux.dev>;
	Sun, 19 Mar 2023 14:36:06 -0700 (PDT)
Received: from [10.225.163.91] (unknown [10.225.163.91])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4PfrlK1xCLz1RtVm;
	Sun, 19 Mar 2023 14:35:57 -0700 (PDT)
Message-ID: <de10b014-1a97-e74a-c7c4-b1004bf4cb60@opensource.wdc.com>
Date: Mon, 20 Mar 2023 06:35:55 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: pinctrl: Drop unneeded quotes
To: Rob Herring <robh@kernel.org>, =?UTF-8?Q?Andreas_F=c3=a4rber?=
 <afaerber@suse.de>, Manivannan Sadhasivam <mani@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Damien Le Moal <damien.lemoal@wdc.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>,
 Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Heiko Stuebner <heiko@sntech.de>, Tomasz Figa <tomasz.figa@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Michal Simek <michal.simek@xilinx.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 asahi@lists.linux.dev, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20230317233623.3968172-1-robh@kernel.org>
Content-Language: en-US
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20230317233623.3968172-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/18/23 08:36, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
Damien Le Moal
Western Digital Research

