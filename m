Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A336E4EA393
	for <asahi@lists.linux.dev>; Wed, 14 Oct 2026 10:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791972895; cv=pass; b=pQot11dfcOlHlNqX9u5d8A3CtiEXuP5OaNQWgd9x3a7erVuZ3Lwn2Fnsq9xntZ2diqfQA+kMwKdJlZn8U7gzdj4Y5JLXQvahFUvVxjT2rUHSyx0RIDUwaP4W9Nh4WKJk1MuZC8Bt+dCgILI5XYiEEYhlXKocH1hYubGjs6Xtdzk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791972895; c=relaxed/simple;
	bh=+23UWhQI/KNob9ARYWQiZhgyqTCPgnw2PPmhgS8i4i4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kKp5NeLwVGM+GV6odzxjaEkbtpsgjwjkYtAfD2AnyTv+Z2ZqNS0uLdDqd8dQCf5woYGdHoFFUkPpZsMk3+kgUeCAksPVcQlxXNpVUAB1g8VPhKct/q86ZoM25/qDoMBXNJsQEdLiB05T5AjiLG1UaYMI9i8y6IEZZDQ/jmHchyA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MtofjYjW; arc=pass smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MtofjYjW"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-6790844c9b0so2999970d50.2
        for <asahi@lists.linux.dev>; Wed, 14 Oct 2026 03:14:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791972888; cv=none;
        d=google.com; s=arc-20260327;
        b=qoZwIev8bqFrdiMzDTSH3cBu0diFrweXIb7DzEpkuK18R0bH3EhnNOZW9re1H0k3aw
         elOB7DPao6BVZJ2qWCNf4ve74MFm/lpGGO9nvFpQIHkuowAhXD4XUvqN1cL77j+/cdGE
         cGL0HzNSTvWzAglTMJzJ77U0jgqWmwdPNXIwOXkTzBeyiYgQ2eIsdeGsus8JETV8QIoj
         dpFfubq17EJk4qpkIOSgKo9gvKuniw7h47Ee0WzB8u85KKoRyywj8CAk2C/KksrIi8N+
         4kZAoXuZXxBj+3zF0ZtXhkpvCl1JVcf/QHKwKcs6Pl12ODATTgvJRDX66lsNsHEZAAjX
         TVRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Edwfse8WHzu9gP6zUwwr3O8TIa4a9hek/bDZw8bIzFg=;
        fh=Ttzw1c75Yz15NiycFPrweyENsLwWob++fy4MhduAYcQ=;
        b=JAUPvjHGn/2coMN3hslBIf8G61C1HNE263c5KKiJDcVTC3mtCLk581xnegPYwFjWH+
         JUPKiq6zqTh3bq4RfJXMWDnQa/4QwtFqBl3MYS4wL5r8CJO7d44JjmyN2rsvBAaSeJ0V
         7qrhUDrts7d32kAObATRSpCsqCx1gzOswkSWDLZ2Ws4/7krYjrL4Zj4bgvPsyHbtKdL8
         g/zdz8XfpAZpcGBGAwqX4JuxaBL7Hnf5ekuJPr27ECboRI5o08NX+6MfNtUcwg2c+5W1
         AWCcb2Jc4bcvKW3DJBIizn1vp3YAFu01DT1aFYZCWErfyNM3DuQd+kPz77V+2F99mJy9
         ZEaA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791972888; x=1792577688; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Edwfse8WHzu9gP6zUwwr3O8TIa4a9hek/bDZw8bIzFg=;
        b=MtofjYjWvDWlGwXlIK3usJpJfh+VXnKH2V5I26gqN1NGQ6bei1bpZT4eE+AcgIE2+N
         gSwWTVyL+W7DEj+h+j/YixTz43Iz8JRmt5cCJKvyXBSMYfmxvTjeBxcMVk6WfiOXWjCV
         NSmlNWCEiVJU2j0cX3noPKSGCRhe9I3KBv+bA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791972888; x=1792577688;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Edwfse8WHzu9gP6zUwwr3O8TIa4a9hek/bDZw8bIzFg=;
        b=eaqOi2D61FGhe+x/OCNuoiUsKOycXBmwx0rdVdWgAeS2QVfPLPTigd4eqAiQtcXsNn
         JAgxaLSyqByvzUkOrlASukwtbsxGdH76CGv/Nw57YD5ZKK0spGwPCxzi3jZPuS0abGoT
         GYTYtoaDCyLgS5MNuEuyoFbEksY57fI9hvUbFop/nmg4aUUT6tfJgPyqncKTQIIauBUH
         lyNBt2f9JLhhOkr1OhjLx4zgazixLP8nnssxkD7XwL7wu32GT7z6WkZj6NYIUTkcR8ep
         mNP/WE10OkSklF5IkzwNa9pqgxP9BjjKgvJc4od6H6Gx5Ds9WYamcQM2MIp2ux5vrIFW
         Tvgg==
X-Forwarded-Encrypted: i=1; AKwUvBzUUz1doN1FH7Em+o9oOwA/pdkrALYLpZt4jJDOrImJNGjcwgAB+kusP5Cb8jReQtoLep78zw==@lists.linux.dev
X-Gm-Message-State: AFq9FYKoR2tcq+WRMVHbruQnALkK2MNxwdV5YxEIW5EtGEx8I2NlO0Xl
	lhdivWZSwUqpDLdwVw5VaLWi/vBTCkTPyO4ax8tQ8NaY56FbPIM/SR/C+6LNwuy6jl2S2Cr5lrI
	qaJfvShZc8aPMTS9FOcdh1zlg35KfK294UlUqLTcc
X-Gm-Gg: AYBFou0oNKxjl/M8AJ0YYz74QZ2ufexOouaRkQSkxXlzIdvqLF+r1i7kkqaUTxRJxGF
	8vwWMHKxl5znoDsHeRm5y9JEW3zuAhttBzaIzu44RVAOAN245qe+46wiCJN4yxrlhETHm9K5y2s
	IaVVbE3AMpI6BkXe420FGWw/nG2hMa73c52tf/0sKjRIzvOBg/flYuCLusrF07dK33tN4am5Sx5
	J/tdGUBLlCSjqbgudo/U9eLisZ6UOwjtgQspD52t9uuZayxSSvu2Bt0MOIsMlW2wBuxbaUegR/Z
	NsxtfOR+jRyely5kYu/UuLaqrG0AD4/WjTbupC4t+1IqECGlwUS0ef/o
X-Received: by 2002:a05:690e:1206:b0:677:ac49:ebc4 with SMTP id
 956f58d0204a3-67936a424f4mr7759702d50.67.1791972888459; Wed, 14 Oct 2026
 03:14:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261014082037.1774672-1-wenst@chromium.org> <20261014082037.1774672-3-wenst@chromium.org>
 <7020a7a6-332e-4fd0-a659-d82eb768614c@linaro.org> <CAGXv+5G1kgyumbj7wGf6rPFbg3spSO0zYmEkn-hZT4qUdJbytA@mail.gmail.com>
 <03375a31-0ac6-47a4-b0dc-6327080e1622@linaro.org>
In-Reply-To: <03375a31-0ac6-47a4-b0dc-6327080e1622@linaro.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 14 Oct 2026 19:14:37 +0900
X-Gm-Features: AclHuK8K2ha0wfmSqlf_vB5Bnq5oR8A0v5D4YSyisrVXA9HcSK0AnBminp1imug
Message-ID: <CAGXv+5H+ZZXnZKB4EzXP0O9f4YGHBHsz3YCRyRJgX9V6RW1eug@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: usb: snps,dwc3: Fix downstream port numbering
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Sven Peter <sven@kernel.org>, 
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, Michal Simek <michal.simek@amd.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, Minda Chen <minda.chen@starfivetech.com>, 
	Shyam Pandey <radhey.shyam.pandey@amd.com>, Wei Yang <yangwei1@eswincomputing.com>, 
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>, Hang Cao <caohang@eswincomputing.com>, 
	Li Jun <jun.li@nxp.com>, Peng Fan <peng.fan@nxp.com>, Roy Luo <royluo@google.com>, 
	Yang Xiwen <forbidden405@foxmail.com>, 
	Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>, 
	Robert Marko <robert.marko@sartura.hr>, Xu Yang <xu.yang_2@nxp.com>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Stanley Chang <stanley_chang@realtek.com>, 
	Ze Huang <huang.ze@linux.dev>, Aswath Govindraju <a-govindraju@ti.com>, 
	Roger Quadros <rogerq@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev, linux-aspeed@lists.ozlabs.org, imx@lists.linux.dev, 
	linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 6:44=E2=80=AFPM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> On 10/14/26 11:29, Chen-Yu Tsai wrote:
> > On Wed, Oct 14, 2026 at 5:28=E2=80=AFPM Neil Armstrong
> > <neil.armstrong@linaro.org> wrote:
> >>
> >> On 10/14/26 10:20, Chen-Yu Tsai wrote:
> >>> The DWC3 controller can operate in host mode. It does so with a XHCI
> >>> compliant host controller. The XHCI has two downstream ports, one for
> >>> HS and one for SS. USB downstream ports start from 1, not 0.
> >>
> >> Is there something in index 0 we will need to define at some point ?
> >
> > On the host side, no. Downstream ports start at 1.
> >
> > On the device mode side, I believe the numbers are completely made up.
> >
> >> Using 0 as base for numbering in DT isn't incompatible with the USB
> >> spec using base 1 for numbering,
> >
> > But you end up with diverging numbering schemes, and it diverges
> > from other USB controllers, particularly XHCI, which DWC3 embeds.
> >
> > And it also differs from the numbering currently used for directly
> > connected onboard devices (like hubs), which use or expect the USB
> > numbering scheme.
> >
> > Sure we can make DWC3 "special", drop inclusion of usb-hcd.yaml,
> > and duplicate the section for onboard devices. On Linux, we can
> > add some more code to xhci_find_raw_port_number() to make an
> > exception for DWC3 controllers.
> >
> > Also, usb_of_get_connect_type() is already broken for DWC3 based
> > controllers that only describe the HS connection but not the SS
> > connection. usb_of_get_connect_type() currently doesn't call
> > usb_hcd_find_raw_port_number() so both HS and SS get mapped to port 1,
> > which wouldn't be in the DT since HS is currently port@0. But even if
> > it did, SS would get mapped to port 2 anyway.
> >
> >
> > IMHO having consistent numbering across controller types would be
> > better. This avoids making the USB core and hub code deal with more
> > exceptions, and also easier to understand and write device trees.
>
> I was in the impression the port number not necessarily reflects
> an actual physical numbering, and can be a logical number we would
> then map in the kernel.
>
> I don't see any issue here having base 0 for the bindings and then
> converting it to base 1 for the XHCI port numbering.
>
> Each controller (Host, Device, OTG) will have it's own numbering anyway,
> so using the XHCI numbering only sounds a bad idea TBH.

OK. So we keep the port numbering, which is different from the embedded
device numbering, even for the same dual role controller? See below.

I hope you see why I think it is confusing.

> >
> >>> Reconcile the downstream port numbering with the common USB host
> >>> binding, renumbering the downstream port numbers from 0 and 1 to
> >>> 1 and 2.
> >>>
> >>> This is non-backwards compatible, however it won't break current
> >>> major implementations:
> >>>
> >>> - dwc3 "gadget mode" in Linux kernel only requires a connection to be
> >>>     present; it doesn't matter which port it is
> >>>     - dwc3 "host mode" OF graph connections aren't supported yet [1]
> >>> - FreeBSD doesn't use the OF graph for anything
> >>> - U-boot doesn't use the OF graph for USB
> >>> - OpenBSD doesn't support dwc3, only the XHCI in dwc3, and doesn't us=
e
> >>>     the OF graph for USB
> >>> - coreboot doesn't use the OF graph for anything
> >>> - Zephyr doesn't support dwc3
> >>> - TF-A doesn't use the OF graph for anything
> >>> - EDK2 doesn't support dwc3 and doesn't support OF graph
> >>> - OP-TEE doesn't support dwc3 and doesn't support OF graph
> >>>
> >>> [1] WIP to tie OF graph port node to USB port device
> >>>
> >>> Fixes: a33113f73693 ("dt-bindings: usb: snps,dwc3: document HS & SS O=
F graph ports")
> >>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> >>> ---
> >>> It is unclear to me whether the HS/SS numbering is fixed for all dwc3
> >>> variants. I checked Allwinner H616 and Rockchip RK3588 and they both
> >>> have HS as port 1 and SS as port 2.
> >>>
> >>> This also doesn't cover a potential "multi-port" DWC3 implementation,
> >>> which Qualcomm seems to have.
> >>
> >> It breaks the current Qualcomm numbering on numerous boards.
> >
> > Yes. It breaks _everyone_ using the current numbering in the sense that
> > they are no longer valid, but should not affect actual usage.
>
> Older DT are supposed to be working on new kernels, you will break ABI
> and will break usage if the port numbering is enforced to enabled embedde=
d
> hubs for example.

On that front, embedded hubs already require you to use the USB numbering.

If you write

    dwc3 {
        hub@0 {
            compatible =3D "usb0123,abcd";
            reg =3D "0";
        };
    };

It won't match anything. The current USB HCD binding doesn't prevent you
from using port 0, but the kernel won't tie the USB device to it, even
if it is a single port USB controller. As I mentioned, USB downstream
ports start at 1, even for root hubs that only have 1 downstream port.

The kernel also doesn't check if the compatible property is correct, but
that is a separate issue. Maybe it should though, so people can see that
their DT is incorrect, like if they swapped HS and SS ports for a USB 3.x
hub.


ChenYu


> Neil
>
> >
> > This comment refers to "multiport" controllers from Qualcomm [1], which
> > would have ports beyond 1 and 2.
> >
> > [1] https://lore.kernel.org/all/20240420044901.884098-8-quic_kriskura@q=
uicinc.com/
> >
> >
> >>> ---
> >>>    Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml | 4 ++=
--
> >>>    1 file changed, 2 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3-common.y=
aml b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> >>> index 6c0b8b653824..4b6304bd2ec1 100644
> >>> --- a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> >>> +++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> >>> @@ -410,11 +410,11 @@ properties:
> >>>          property is used.
> >>>
> >>>        properties:
> >>> -      port@0:
> >>> +      port@1:
> >>>            $ref: /schemas/graph.yaml#/properties/port
> >>>            description: High Speed (HS) data bus.
> >>>
> >>> -      port@1:
> >>> +      port@2:
> >>>            $ref: /schemas/graph.yaml#/properties/port
> >>>            description: Super Speed (SS) data bus.
> >>>
> >>
>
