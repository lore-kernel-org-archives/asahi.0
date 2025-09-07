Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB3D1B4224
	for <asahi@lists.linux.dev>; Sun,  7 Sep 2025 08:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757235278; cv=none; b=OxYeEbAKUmcdlasZmAj1rgJ7o/OQiVUgMMtuDPGXP4/Bxkm/jlJv11aVPFGJPbgmW0pc+6RS6+5dhf31+qYihAUe8flsjDBGvCLmM+ABgjRXTUYVaIPAEk3BexfK2CILHlmNXL7dNDdh735bKOoRnuGWwmGcf7idByPrd91Bxow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757235278; c=relaxed/simple;
	bh=sI7STwx5H6Ky6Q9bvFA9/p6Gsvpg4KWheBRc3GxyDeE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lZTqJ5AxWSRvryjyOFsSc6ScMSC9GU95Z/bz0AkzhP2+tuCmlpLNjaaMVKXhepgf63aZjrICdHDRjFR1D8ifKXzHcNO/9EZ1jDkoSUuq3WR9LBE5LSQ+6FRrA3K1pc+WxPrrcFlSn65kUf9ISMKty8uAEQLQH+q9voXwiO9TKQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cO0L9nRs; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cO0L9nRs"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-55f72452a8eso4119376e87.3
        for <asahi@lists.linux.dev>; Sun, 07 Sep 2025 01:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757235275; x=1757840075; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ta1cFo0XDUArRgBS4UrHkNCAuCKCm6jMm0yBvo/F4kU=;
        b=cO0L9nRsUwAf72nzsEi6vwjiTyNqoYtYY/DdEQZbdq/MAJ7mNmqaG1i/sG0itJwVtH
         Psf6FFdkxUhBQuGXpHkyDG/mgfsc8BBKl7oDCVLkCvERZjeRqiwF0gdKvoZMsqv4/lGj
         e1+gJxuR17q2rOnMGxKnvQCxJ5QZ0sSKfJP9QWk6txkWUwmIUsYV4w1cCtSIgANJnYN9
         RURl1GZb8/+7OM1mb14pWDz10ENPenpFTqIed0fRDzXl5EljZ+0l+2mrYit+OD9yVMfo
         3Q3GcE/URmGrYs2H3+7WTC6xsPf8o170ujp7KxYHCQH4ma7LOzGKWmUKK3KOxHBBPTfW
         0zAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757235275; x=1757840075;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ta1cFo0XDUArRgBS4UrHkNCAuCKCm6jMm0yBvo/F4kU=;
        b=cawT/Hu8ysK9R69R3mq2xTBUBJ+XjBVOlX9WfsjJdhVkZvEQa3HfTyXHj+fIHKnd4o
         uY5+MJNrdWRtU3Ic9yO63VJpHA7bfG+o9dZym1OyT/oB1uPUzJbZ59i8sHjLNUBlDO2z
         r2K5GpOot4I1kEMR0XIiSE2KXtRB4xe/u4hXYwfi0xa6Kqwj5xTGBhupfqWzmRRMx4C8
         PnLBxQqvnMhtCeb/5PoO50RHT76CCHgpzytx+vMpZJMt1lxK8bWMWqNufkA5IoU182eI
         4owx1l21aEyQ15iTA0EQqwRsdZiJYcIgTb8bX5GvVvB7HmdVMex+sQfj3tmAMBGLM15m
         RnGg==
X-Forwarded-Encrypted: i=1; AJvYcCUKE1MqyR7lQNAMNHGli7cl1wD2fu8fMDTjffhnfW3VpqNYbc5BhRtUtPke8/koxq20Hpdsmg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwQDwRoYnDP3WMGoGUzI7pdLMqLzFKw8Fjjyo6os+I5LnnGehHv
	NXq2GViIdVFjbm876YdQz9yoDKtIBW4p9jVNE1k28mcqYCztVpt8mj0i
X-Gm-Gg: ASbGncu4ljW4oAydOBSSmujvaLtQ7CHQl7T1v6F0uLEqCW7PYCManLfV157wkGGKmc3
	ppZ3FFZoBPaGCGQwcM0MpvefRzAwUpBX2hR0gbVI/67RKAGqdvyUooDWjRFGzsnE+zcIp+Rk2W4
	Io1jySe7ydSgch6R4OqVcT+eOKezB/FEePWljWEXOQYtwmAuSP2gUgyIKFUBbop0i7lAt7Ba6Ty
	6amWLqosIZ2gKEuafMKTE8HDOynFMm2kwk1S1Gvq7g0rhXWoHgpA7Y5VH9736xRtCJqfiruSTP7
	dDlj9UUb0PuKd+PU5Cf3GINJjeoRTcCZRKCJP9Uqi7RIhAGogQJ3Cpy7KU4+3tARxYnDaQ46rNn
	5l9huXzMhis4Co0vyy6+CwW+0jMNqhH6luUmoI3HwHSrJ7ZabTSXlQnJ8SVDFZpn+MgOJER/Hj0
	vQ
X-Google-Smtp-Source: AGHT+IFiJ49HQNMd/IFx7xIzrrtqMETUdaxARpaq6+DVUgUYdtERBew8emcGESiiMQvJ8usHN1vC9A==
X-Received: by 2002:a05:6512:3e25:b0:55f:6759:a792 with SMTP id 2adb3069b0e04-562636d6328mr1074855e87.34.1757235275009;
        Sun, 07 Sep 2025 01:54:35 -0700 (PDT)
Received: from ?IPV6:2a00:1fa0:730:6bf5:b6a:8710:4129:8b95? ([2a00:1fa0:730:6bf5:b6a:8710:4129:8b95])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ace8121sm2814508e87.84.2025.09.07.01.54.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Sep 2025 01:54:33 -0700 (PDT)
Message-ID: <f09dedfc-1f1b-4416-b854-9c4059ba264a@gmail.com>
Date: Sun, 7 Sep 2025 11:54:31 +0300
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/22] usb: typec: tipd: Update partner identity when
 power status was updated
To: Sven Peter <sven@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>,
 Ran Wang <ran.wang_1@nxp.com>, Peter Chen <peter.chen@nxp.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 Hector Martin <marcan@marcan.st>
References: <20250906-atcphy-6-17-v2-0-52c348623ef6@kernel.org>
 <20250906-atcphy-6-17-v2-12-52c348623ef6@kernel.org>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <20250906-atcphy-6-17-v2-12-52c348623ef6@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/6/25 6:43 PM, Sven Peter wrote:

> From: Hector Martin <marcan@marcan.st>
> 
> Whenever the power status is changed make sure to also update the
> partner identity to be able to detect changes once de-bouncing and mode
> changes are added for CD321x.
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>  drivers/usb/typec/tipd/core.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> index c7cf936e5a61a331271c05b68ff1b77b89c0f643..cd427eecd8a594b7e609a20de27a9722055307d8 100644
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c
> @@ -635,9 +635,16 @@ static irqreturn_t cd321x_interrupt(int irq, void *data)
>  	if (!tps6598x_read_status(tps, &status))
>  		goto err_unlock;
>  
> -	if (event & APPLE_CD_REG_INT_POWER_STATUS_UPDATE)
> +	if (event & APPLE_CD_REG_INT_POWER_STATUS_UPDATE) {
>  		if (!tps6598x_read_power_status(tps))
>  			goto err_unlock;
> +		if (TPS_POWER_STATUS_PWROPMODE(tps->pwr_status) == TYPEC_PWR_MODE_PD) {
> +			if (tps6598x_read_partner_identity(tps)) {
> +				dev_err(tps->dev, "failed to partner identity\n");

    Perhaps "failed to read partner identity\n"?

[...]

MBR, Sergey

