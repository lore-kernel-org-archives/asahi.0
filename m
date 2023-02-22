Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3267EA92D;
	Wed, 22 Feb 2023 21:15:08 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id s26so35833193edw.11;
        Wed, 22 Feb 2023 13:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1hpkcdj31Kp+64I0H+8QjpzTiuX76hZTeMvrWdpVOt4=;
        b=Y95tEBQTvJnja0wiaBFlONHEPFFpg4E5Aidd7Wxu88GO6+Efw9s32CSm6Qrv+mXXKE
         i5+x1nQprf7tfF0IcJzKPjG26LQSm8lVS+CQndNmsIeuLxTz3Zws+u23ldaG3K54+WIL
         IKeo6NJCJ7WchtpfymyIpeNWai8L7kAy3lwcxu51e9DNdYZrZ0f3D1Sw8ivAk+CfDKS3
         Ek4oq62+5hOyx3h0ySU4oZmDiESIURoGhUvHFCUOXpdaqhWIldAEFOJmG9Rfku2zdt2S
         XHD98cqCLTBp5a+c55IWJPbpd06egfIFbD37YQMjJACS4ZlT8leLyYR4DAvtMaXLTN/X
         IY6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1hpkcdj31Kp+64I0H+8QjpzTiuX76hZTeMvrWdpVOt4=;
        b=thMq8KbCqsWNousqpeBo+eweUiagiITTc+gaHhNIqfuvv6xzl/JJDAbv27v1VU74YD
         az246G5CD7CsZsrpArDluLAPcOV8r9DN4hNc2/J2hnKhTzco95p/becgk2hxT0hKChSg
         XvB2uHDGm9alk2HuZirBA1ClJgFZE0/Sam14o4nmHbjBUDbnKbVXQFT+m3y+cZwcl8ET
         PWm6gbUDaKzrvO/4XPrRz1mjjNC/VmZ8lY0PFiUPU26J1t5pJI+08jNzEG6/QzLllZ7f
         +1EfC54/sodm3ilO4VZFwd1fkC1F59Yq4mTIl1ftGeRg71QlqCE1rC1LvmdMct9OGHgD
         bsJg==
X-Gm-Message-State: AO0yUKUhQKeFDG6+7gGWn35yhH41xsqFbdKPN3SH3JI/QwRSvQf3LyTL
	zx7d9ouGlxuVxlhqzWyDlROga3HbWyde6g8bpUs=
X-Google-Smtp-Source: AK7set8TXb46bTmDPfzW/xczn6QfGU7MdMXPRf/CaO6cyWdNx+3X84yvibHTXzLWWA/EAH5iiZY+OShEAAHjsEGwRMc=
X-Received: by 2002:a50:f611:0:b0:4ac:b7c1:9109 with SMTP id
 c17-20020a50f611000000b004acb7c19109mr4476929edn.6.1677100506156; Wed, 22 Feb
 2023 13:15:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230221145021.31993-1-zajec5@gmail.com> <CAFBinCDxB=xtz9mtZupBC7J5oxknN1ENHzJ-cFxX4FTDSgZeFQ@mail.gmail.com>
 <101a5bdf-870a-a1bb-954d-1d675ecad5a7@gmail.com>
In-Reply-To: <101a5bdf-870a-a1bb-954d-1d675ecad5a7@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 22 Feb 2023 22:14:55 +0100
Message-ID: <CAFBinCDcDYtdOdikc2ieXjRUkrjgwNKaPYvYZb_v84gh66q=bw@mail.gmail.com>
Subject: Re: [PATCH] nvmem: add explicit config option to read OF fixed cells
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Heiko Stuebner <heiko@sntech.de>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vincent Shih <vincent.sunplus@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Michal Simek <michal.simek@xilinx.com>, Alessandro Zummo <a.zummo@towertech.it>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Evgeniy Polyakov <zbr@ioremap.net>, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	linux-rtc@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Rafa=C5=82,

On Tue, Feb 21, 2023 at 11:29 PM Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>=
 wrote:
[...]
> > I am not familiar with the recent changes around dynamic cells.
> > Is there any discussion/summary that I can read to get up to speed?
>
> Some NVMEM devices don't store specific data at hardcoded offsets. For
> such devices we have drivers (to become: layouts) that parse their magic
> content. They discover cells and register them and provide matching with
> proper DT nodes.
>
> For bindings see:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D084973e944bec21804f8afb0515b25434438699a
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Da607a850ba1fa966cbb035544c1588e24a6307df
>
> For example driver see:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D6e977eaa8280e957b87904b536661550f2a6b3e8
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D207775f7e17b8fd0426a2ac4a5b81e4e1d71849e
>
> For usage see:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Dc8442f0fb09ca3d842b9b23d1d0650f649fd10f8
Thanks, that makes things clearer for me!

> > My main thought is: if there are many "fixed OF cells" implementations
> > and only a few "dynamic" ones - does it make sense to flip the logic
> > and introduce a new "use_dynamic_of_cells" flag instead?
>
> The problem is that there are more cases than just two. We can have:
> 1. No cells at all
> 2. Fixed cells in DT
> 3. Dynamic cells with references in DT
> 4. Driver specified cells (specified within config)
> 5. Cells defined in a global table
>
> So we need to reference DT cells explicitly (we can't just confirm /
> deny *dynamic* cells).
>
> Another solution would be to have "no_fixed_of_cells" but:
>
> 1. Personally I think negation is less clear / easy to follow
>
> 2. There may be actually more drivers with no fixed cells.
> I think I modified 18 drivers. It seems devm_nvmem_register() is
> referenced in 44 places. Few of them may be not actual users but it
> still seems to be about equal.
Thanks for this overview of all the special cases. Please add my:
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
for the following two drivers:
- drivers/nvmem/meson-efuse.c
- drivers/nvmem/meson-mx-efuse.c


Best regards,
Martin
