Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2730F149C7B
	for <asahi@lists.linux.dev>; Mon,  5 Oct 2026 22:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791239817; cv=none; b=qTXmq07N2uwhnUwbNgshM5UFtmNMYP98gTa1XdCnvopZazk0oLjij7xMIS+uz3cOPo8u/8Ne0bTUaCF30aLBJPlmmiuBbhlVbKFtTkH0ST03ZWrtTzxDH5/HulkTP0+aDdbJSwLromgARezqoP55qpWGdKLkOl3d+wvfDjtyeT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791239817; c=relaxed/simple;
	bh=mucEdj1uqoLVSZBfuK1SF6FXby2PwwKZv5l3z18QNLk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XRvJb82edEk1PLfUBFxFBBDgcmsXFcwm2YkOk1km0qxvVBYKPPlO4SLki2s6e7AXYYknLXxEBvM0R20bJ5J/+mhWys3KXBB63GOh+Lztj9oNkW5u/x6QoeqTzfhqHTGUmbC3DaEf7G3AU/6CN+bAFFNPJxj3wphw1CzEJYZjk0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-825572e6701so965910a34.2
        for <asahi@lists.linux.dev>; Mon, 05 Oct 2026 15:36:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791239815; x=1791844615;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xb3yq1vtfACEwe75yrbB1CPQfwdI7baxuA1mRi57je4=;
        b=XcUouIvpfGyCmbHWqFpjWELO326kWyp1uCSts74Xb0fiwb2llwyTXjjdFrKZHwQLOw
         lAgkL4pNhwfKQr5f7fRbyvvNnEmozxdTzdMCbRSV0zEGEdd4HFM6XilZX9Tt5bgBck2f
         fhRKdurf0eI+P45O4ZNCAP7K7memiAUi0alHRBrLCun0F3dVnx91m1S/PZ4iDR7zNi5v
         9tI12Fb+XJhDhj+b2tWuxWVRAAN7Ms6JVpdaR8bSqk18slsdw86n+dO77Ypuck/3uk3L
         raZdsLL1MCfXOi5El1/jOeUa+RxxH0sPBc5GQkKe29qQ5OAiwZK5eSBcb/MwuvHa1DBw
         6ovQ==
X-Forwarded-Encrypted: i=1; AKwUvBwMKRajvhZRjLHzs/CrlBa4qibbaNO+fQJBcgwE9o81kfssFR+1+O1GyfPBhToiCcLBOF1nkA==@lists.linux.dev
X-Gm-Message-State: AFuF++kZOFyi3uHK+/xtf5wVuEZSATl0NlTGL2fkGs2tkQ2gX+5z42ga
	om5EqiMNRObWP1+cIDsSGvGRs3sVMfhC2PDhzHsYyyZqO0rSgMSZwWqIiDKe5r/Q
X-Gm-Gg: AYBFou1noPv3U52UP+47nqSxiLpPaqaCGEdioUc1Ce5qzKiAHHipIJr+gV4p7ct/OqI
	07kXxHmxqqr7ihb5KD6cx2OXKljho9y9vHlzTEV8j3KQBvetEd6LWfYrGK7IEVq4GSFxC6MzD1E
	lJx80rl9zFt8kBLg5km3Dg8P297/PKGOw90iXVnXSV1W7alkUqyc8vCwciczS+uV1q526O9VPz6
	lCUuJfvfY+COabdqzGYD9BiuqPU62znJcoADr8VQw7s8sPZ9ZdmqqllhttpjzMJOt0C5gTtOgmr
	cUgAEuI+w4R4LaNBaEweZESB80Tb4LKKxbcFUBoiRR4L78o3WV7fnZ0l0wxfo3foKR1cpwCZoJ4
	d9/Rfax+RRCEulaXDcdCoiLmUXsQEvKYK48jz8lTN32pOIVgd0+GuJ5QhSGEeK6eCJKm9P26n/N
	5foo/VmDSWEnzMacIdTZk3JtsfjVSVXITuJgn1n2LGJ19Hmi+Y0lEJqljLZzVx91rVrAC0IZfhu
	5TFK1NhcfJid9hKvw7bhRor4f9ztnes8BvcHV0uNahburhHsTdbSbKwLw8L5Lffj3JHRI771ij8
	tk4MrU22CEGwB3DirtRffYvxlWoFvPfj0fVxPf+e558afw==
X-Received: by 2002:a05:6830:661b:b0:822:b69c:fe5a with SMTP id 46e09a7af769-823fde019d3mr9092301a34.27.1791239814932;
        Mon, 05 Oct 2026 15:36:54 -0700 (PDT)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com. [209.85.161.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-828209a9efbsm878135a34.21.2026.10.05.15.36.54
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 15:36:54 -0700 (PDT)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6cfb1329979so1627717eaf.1
        for <asahi@lists.linux.dev>; Mon, 05 Oct 2026 15:36:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz9DbrClPRlve9wcwmU935E/ZHlW2efPZ2QMyoc9DWq2ltoJFP0ldFaolJnG/rB/ublJl/9lw==@lists.linux.dev
X-Received: by 2002:a05:6820:2226:b0:6de:1788:c3af with SMTP id
 006d021491bc7-6e09db9eae9mr7389349eaf.43.1791239415075; Mon, 05 Oct 2026
 15:30:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260926-avd-v2-0-ecebe6a3648e@icloud.com>
In-Reply-To: <20260926-avd-v2-0-ecebe6a3648e@icloud.com>
From: Neal Gompa <neal@gompa.dev>
Date: Mon, 5 Oct 2026 18:29:38 -0400
X-Gmail-Original-Message-ID: <CAEg-Je9OY45PLvj2BKyXVfnVo4+VpRL-iQXVvMUVohLYNfWGTA@mail.gmail.com>
X-Gm-Features: AclHuK9yFwOzqsj_JcPTvXfeG7bJIFye1-m4CrTXTFUfDaK1QknzW0JvhVf1j8M
Message-ID: <CAEg-Je9OY45PLvj2BKyXVfnVo4+VpRL-iQXVvMUVohLYNfWGTA@mail.gmail.com>
Subject: Re: [PATCH v2 00/17] media: apple: add avd driver
To: Sofus Forstreuter <sofus.c@icloud.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 26, 2026 at 9:16=E2=80=AFAM Sofus Forstreuter <sofus.c@icloud.c=
om> wrote:
>
> Hi,
>
> This series enables hardware video decoding on Apple Silicon M1, M2 and
> M3 SoCs. It adds support for all the codecs AVD (Apple Video Decoder)
> supports, which is H264, H265, VP9 and AV1 (only on M3+).
>
> The AVD is a bit unique both as a video decoder and an IP block on Apple
> Silicon SoCs. Instead of following the normal "a register for each
> parameter", AVD is programmed through one single register. This means
> the order of the writes are important, but its also important to ensure
> we dont write faster than the hardware can process. To solve this, we
> use the included Cortex-M3 co-processor. The CM3 accepts unsigned code,
> which we take advantage off [1].
> The driver prepares the instructions and writes them into segments,
> which are submitted to the CM3. The CM3 then programs the hardware and
> notifies the AP when the job is done or if an error occurred.
>
> The driver implements the V4L2 M2M stateless decoder API. The driver's
> framework is based very heavy on rkvdecs driver. It therefore comes as
> no suprise that `v4l2-compliance` reports no errors:
> Total for avd device /dev/video0: 49, Succeeded: 49, Failed: 0, Warnings:=
 0
>
> The fluster scores are:
> JVT-AVC_V1: 77/135
> JVT-FR-EXT: 42/69
> VP9-TEST-VECTORS: 216/305
> VP9-TEST-VECTORS-HIGH: 1/6
> JCT-VC-HEVC_V1: 143/147
> AV1-TEST-VECTORS: 238/242
>
> Since not all unsupported H264 streams are rejected, the scores
> depend on the reset working, this only works with a patch to the
> apple-dart driver so that the IOMMU attach/detach trick works.
>
> All codecs support 4:2:2, 4:2:0, in 10 and 8 bit. By default, AVD
> outputs in NV12, NV16, P010 and P210. Support for 4:4:4 and 12 bit
> formats has not been added yet.
>
> Internally the AVD uses an Apple specific compressed and tiled format
> called Interchange to store reference image data. This is stored after
> image data across all codecs. Apple Interchange is used for sharing
> buffers with other hardware blocks (GPU, display controller), support
> for this is on its way [2].
> The V4L2 pixel formats have been added to help with calculating sizes.
>
> This driver has been tested on most Apple Silicon SoCs in our downstream
> tree [3]. Its expected this driver will work on M4, M5, M6 and the Neo,
> with firmware already being written for all except the M6 SoCs [4].
>
> The groundwork for this was laid many years ago by Jamie, R and Eileen,
> who through a combined effort managed to reverse engineer many core
> parts of the AVD block.
> This driver would not have been possible without the work done by
> Eileen, who wrote initial support for H264, H265, VP9 and excellent
> tooling [5], allowing me to reverse engineer AV1 and make the driver
> conformant.
>
> [1] https://github.com/sofus13/avd-fw/tree/avd-next-fw
> [2] https://patch.msgid.link/20260917-apple-interchange-modifier-v1-1-875=
294689c48@gmail.com
> [3] https://github.com/AsahiLinux/linux
> [4] https://github.com/AsahiLinux/avd-fw
> [5] https://github.com/eiln/avd/tree/main
>
> Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
> ---
> Changes in v2:
> - Patch order
> - Fixed dt-bindings by constraining all properties
> - Fixed dts, add interrupts, iommus and regs. Drop labels, fix names
> - Add Apple Interchange format
> - Add more av1 and vp9 validation to v4l2-ctrls
> - Validate more codec parameters
> - Use the new CM3 firmware (drop avd-hw, drop submission loops)
> - Updated cover to reflect changes
> - Link to v1: https://patch.msgid.link/20260918-avd-v1-0-49977931f455@icl=
oud.com
>
> To: Sven Peter <sven@kernel.org>
> To: Janne Grunau <j@jannau.net>
> To: Neal Gompa <neal@gompa.dev>
> To: Mauro Carvalho Chehab <mchehab@kernel.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Sofus Forstreuter <sofus.c@icloud.com>
> To: Philipp Zabel <p.zabel@pengutronix.de>
> To: Heiko Stuebner <heiko@sntech.de>
> Cc: asahi@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-media@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-rockchip@lists.infradead.org
>
> ---
> Sofus Forstreuter (17):
>       dt-bindings: media: add apple,avd
>       media: v4l2: Add P210 pixel format
>       media: v4l2: Add Apple interchange pixel formats
>       media: v4l2-ctrls: validate av1 tile info
>       media: v4l2-ctrls: validate vp9 tile_rows_log2
>       media: apple: add avd driver
>       media: apple: avd: add h264 support
>       media: apple: avd: add vp9 support
>       media: apple: avd: add hevc support
>       media: apple: avd: add av1 support
>       arm64: dts: apple: t8103: add avd nodes
>       arm64: dts: apple: t8112: add avd nodes
>       arm64: dts: apple: t8122: add avd nodes
>       arm64: dts: apple: t600x: add avd nodes
>       arm64: dts: apple: t602x: add avd nodes
>       arm64: dts: apple: t6030: add avd nodes
>       arm64: dts: apple: t6031: add avd nodes
>
>  .../devicetree/bindings/media/apple,avd.yaml       |  127 +
>  .../userspace-api/media/v4l/pixfmt-yuv-planar.rst  |   14 +-
>  MAINTAINERS                                        |    2 +
>  arch/arm64/boot/dts/apple/t600x-dieX.dtsi          |   32 +
>  arch/arm64/boot/dts/apple/t602x-dieX.dtsi          |   32 +
>  arch/arm64/boot/dts/apple/t6030.dtsi               |   32 +
>  arch/arm64/boot/dts/apple/t6031-dieX.dtsi          |   32 +
>  arch/arm64/boot/dts/apple/t8103.dtsi               |   32 +
>  arch/arm64/boot/dts/apple/t8112.dtsi               |   32 +
>  arch/arm64/boot/dts/apple/t8122.dtsi               |   32 +
>  drivers/media/platform/Kconfig                     |    1 +
>  drivers/media/platform/Makefile                    |    1 +
>  drivers/media/platform/apple/Kconfig               |    5 +
>  drivers/media/platform/apple/Makefile              |    3 +
>  drivers/media/platform/apple/avd/Kconfig           |   18 +
>  drivers/media/platform/apple/avd/Makefile          |    5 +
>  .../media/platform/apple/avd/avd-av1-entropymode.c | 4698 ++++++++++++++=
++++++
>  .../media/platform/apple/avd/avd-av1-entropymode.h |  284 ++
>  drivers/media/platform/apple/avd/avd-av1.c         | 1432 ++++++
>  drivers/media/platform/apple/avd/avd-drv.c         |  776 ++++
>  drivers/media/platform/apple/avd/avd-h264.c        |  862 ++++
>  drivers/media/platform/apple/avd/avd-hevc.c        | 1340 ++++++
>  drivers/media/platform/apple/avd/avd-inst.h        |  210 +
>  drivers/media/platform/apple/avd/avd-v4l2.c        |  992 +++++
>  drivers/media/platform/apple/avd/avd-vp9.c         | 1054 +++++
>  drivers/media/platform/apple/avd/avd.h             |  299 ++
>  drivers/media/v4l2-core/v4l2-common.c              |    8 +
>  drivers/media/v4l2-core/v4l2-ctrls-core.c          |   17 +-
>  drivers/media/v4l2-core/v4l2-ioctl.c               |    7 +
>  include/uapi/linux/v4l2-controls.h                 |    2 +-
>  include/uapi/linux/videodev2.h                     |    9 +
>  31 files changed, 12386 insertions(+), 4 deletions(-)
> ---
> base-commit: 4efa625593e1e9c76346232413997556dea1d89f
> change-id: 20260917-avd-7ee5474b468c
>

Series LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
