Received: from 4.mo583.mail-out.ovh.net (4.mo583.mail-out.ovh.net [178.33.111.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF2F253C8
	for <asahi@lists.linux.dev>; Tue, 18 Jul 2023 10:35:24 +0000 (UTC)
Received: from director2.ghost.mail-out.ovh.net (unknown [10.109.143.209])
	by mo583.mail-out.ovh.net (Postfix) with ESMTP id 918CA25C32
	for <asahi@lists.linux.dev>; Tue, 18 Jul 2023 09:19:55 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-mn4ct (unknown [10.109.138.229])
	by director2.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 9177E1FEB2;
	Tue, 18 Jul 2023 09:19:49 +0000 (UTC)
Received: from RCM-web4.webmail.mail.ovh.net ([176.31.235.81])
	by ghost-submission-6684bf9d7b-mn4ct with ESMTPSA
	id gQ79HjVZtmSJDgAAInjvQA
	(envelope-from <rafal@milecki.pl>); Tue, 18 Jul 2023 09:19:49 +0000
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 18 Jul 2023 11:19:49 +0200
From: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, Srinivas
 Kandagatla <srinivas.kandagatla@linaro.org>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Alessandro Zummo <a.zummo@towertech.it>,
 Vignesh Raghavendra <vigneshr@ti.com>, Kunihiko Hayashi
 <hayashi.kunihiko@socionext.com>, linux-mtd@lists.infradead.org, Miquel
 Raynal <miquel.raynal@bootlin.com>, Evgeniy Polyakov <zbr@ioremap.net>,
 Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Alyssa Rosenzweig
 <alyssa@rosenzweig.io>, Heiko Stuebner <heiko@sntech.de>,
 linux-rtc@vger.kernel.org, Samuel Holland <samuel@sholland.org>, Richard
 Weinberger <richard@nod.at>, Michal Simek <michal.simek@xilinx.com>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>, NXP Linux Team
 <linux-imx@nxp.com>, Vincent Shih <vincent.sunplus@gmail.com>, Orson Zhai
 <orsonzhai@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>,
 linux-sunxi@lists.linux.dev, asahi@lists.linux.dev, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Sven Peter <sven@svenpeter.dev>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mediatek@lists.infradead.org, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>, Hector Martin <marcan@marcan.st>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Michael Walle <michael@walle.cc>, Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Kevin Hilman
 <khilman@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea
 <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH V4] nvmem: add explicit config option to
 read old syntax fixed OF cells
In-Reply-To: <e5a8524c-8961-9ff0-db30-3b648345319e@pengutronix.de>
References: <20230403225540.1931-1-zajec5@gmail.com>
 <e5a8524c-8961-9ff0-db30-3b648345319e@pengutronix.de>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <d51234ebc05d2b9fe44625299c103caa@milecki.pl>
X-Sender: rafal@milecki.pl
X-Originating-IP: 31.11.218.106
X-Webmail-UserID: rafal@milecki.pl
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 6429732894367460296
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrgeeggdduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeggfffhvfevufgjfhgfkfigihgtgfesthejjhdttdervdenucfhrhhomheptfgrfhgrlhcuofhilhgvtghkihcuoehrrghfrghlsehmihhlvggtkhhirdhplheqnecuggftrfgrthhtvghrnhepgfeuleeuteetfeeuhefhhffgtedvgeejfeelffeuvdfhueffvdehgeeuveeuhfelnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpfedurdduuddrvddukedruddtiedpudejiedrfedurddvfeehrdekudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehrrghfrghlsehmihhlvggtkhhirdhplheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheprghsrghhiheslhhishhtshdrlhhinhhugidruggvvhdpoffvtefjohhsthepmhhoheekfedpmhhouggvpehsmhhtphhouhht

Hi Ahmad,

On 2023-07-18 11:08, Ahmad Fatoum wrote:
>> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
>> index 60670b2f70b9..334adbae3690 100644
>> --- a/drivers/mtd/mtdcore.c
>> +++ b/drivers/mtd/mtdcore.c
>> @@ -522,6 +522,7 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
>>  	config.dev = &mtd->dev;
>>  	config.name = dev_name(&mtd->dev);
>>  	config.owner = THIS_MODULE;
>> +	config.add_legacy_fixed_of_cells = of_device_is_compatible(node, 
>> "nvmem-cells");
> 
> How does the new binding look like in this situation?
> 
> Before it was:
> 
> &{flash/partitions} {
> 	compatible = "fixed-partitions";
> 	#address-cells = <1>;
> 	#size-cells = <1>;
> 
> 	partition@0 {
> 		compatible = "nvmem-cells";
> 		reg = <0 0x100>;
> 		#address-cells = <1>;
> 		#size-cells = <1>;
> 
> 		calib@1 {
> 			reg = <1 1>;
> 		};
> 	}
> };
> 
> It it now the same, but s/"nvmem-cells"/"fixed-layout"/ ?

Please take a look at those commits and examples:

bd912c991d2e ("dt-bindings: nvmem: layouts: add fixed-layout")
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=bd912c991d2ef079a32558f057b8663bcf1fb6fc

fa7fbe53ecdc ("dt-bindings: nvmem: convert base example to use NVMEM 
fixed cells layout")
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=fa7fbe53ecdc4e7d549a9f73a40e257b0046b4b9


Basically you need a "nvmem-layout" node with:
compatible = "fixed-layout";

So in your case that would be:

&{flash/partitions} {
	compatible = "fixed-partitions";

	partition@0 {
		reg = <0 0x100>;

		nvmem-layout {
			compatible = "fixed-layout";
			#address-cells = <1>;
			#size-cells = <1>;

			calib@1 {
				reg = <1 1>;
			};
		};
	}
};
