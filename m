Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C9B34F46D
	for <asahi@lists.linux.dev>; Mon, 20 Apr 2026 20:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776717481; cv=pass; b=YfWv5Bjrc0QqwLjBpfopj5AqRWKDfKwsp71gMJqYsW8/AcFN9p18HuGYyjfBCt7NZ0Nnuv+2K/4qiml5bH8dRQFQimkGzvPCS3dn0Nmv3N2kOj+MtIrTU7zSJmBfwLnmT5lFm7msqZA2//6bsqcKutoaAnSuq4Hz0Ozs5ZaUOVk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776717481; c=relaxed/simple;
	bh=ADQUzdT1kaUTCl9XZzAUwQqYr9cALPSJzCeEmR/kFGM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aBbdYmvmhUsvqgDE77y5C0+eCd9MGgWfg7LW5kzAg26quGcSz13mUftESqD74wgCvCo8k2J2H9+QCJA7K95p+kZN5JHpdIIoLeNgSNcCOsndw16BpZcZQPoqkubI5T3fIgLhvlUTB0xfkSGu2GWW4zrH9DqmerrJyIpGoa00gzI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b2TILBWY; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b2TILBWY"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-6530dd51ccaso3333724d50.3
        for <asahi@lists.linux.dev>; Mon, 20 Apr 2026 13:38:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776717479; cv=none;
        d=google.com; s=arc-20240605;
        b=B5ydqAOvN9Rps7HP8FbymCqPMvks/vhB7wGI89PxG8QAcZDwW67Q4ZghRRX//hT1Lx
         PRy/MFVy1raKCg0QrHM9TQOgKKCzksPSJyVHPCc8LI/B5g5hf08KSFl4lNPlqwrEEsqr
         yf7QOg0pE8+ladkpv2Mrxhs6BCn0OS8fs7u5d3N4aF10CEHFu/uy7VtYyOOzZWwpVBc+
         rQoNImS/IlmRyCHZQCKE45LBFyk9bBfGbR4V9XQt1nzV2kcvSGiyrrdeDInFSmA3W32V
         S0D6HHl/ADDoNg2Wrmpr/5OE7KRQi8dmcODjP8TD2TruEO3d84rtvKnkVGpJso6fTYCj
         sIvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xljAePTDiU88jhAg2MqebjJvsqcljT34hn/5T4lFweU=;
        fh=5iuz06QYbLpIOVOF0VjP//VHG/Qo7ruKNRKG/7CeS64=;
        b=PWiE13Y9NxubJocgHH4XNHlKxz6ygpCSQYtlxyXy3/ftEmJQGZ8n3yDzoj3rdSdj6w
         OX5ySwXKfLxY4WScf2oJ5a/J1bTz9GF2FoTux1THtodBnYNMN0o2OHLsInVrW631Q7IY
         CmIAPfXtpWVCLWJzw8ZirWZDjkbt/0EaSpmzGL4xukVK/+G0pb/rMoBhI73JHyh+zAl0
         0b0PAZnXlC5bR6k4CMCsccqMLqxxmK/z/761pdiYTCJaiFZokiNTUMjf+ICpvN5QizGI
         LlElV4zuHhs2M7ueYaRnWnco78dJ5Rbsv7rt5fgilXxz1ztnuJ7nJmLGYK4JMphv6XFl
         6rKA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776717479; x=1777322279; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xljAePTDiU88jhAg2MqebjJvsqcljT34hn/5T4lFweU=;
        b=b2TILBWYbRd3WrfRtPQrjYLjxTHAUqsO4Cnu+uEnwGnPrnkYoDx4EAlIF9sv6Vvgqu
         zXh7G5L6wgo8UGma7BfBJF7YmaSZ7wUerMGM6u4uRk7fMLKCOIr8kQK4/GjTAgd2qtsJ
         siSCbJ/C3zP5ihU4JHRtNh7UZAz6Zb/YWT1kaF/qpLijmDY+BH3Nd6KT07+WyH1mSGA0
         0gR9uGPPi2Sy19z9lPvOSUbX9vwriMZF33MrbUgiGVoPjHzKVPS9uiUj7tiyI5XjdPcZ
         ltrz5b1PIDGs3Yhq2Qf0jDBd2ghyaFi1eNT+Z0ubV4UfIoXaYx6wuVOK3Kuq38lWOlSc
         g5Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776717479; x=1777322279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xljAePTDiU88jhAg2MqebjJvsqcljT34hn/5T4lFweU=;
        b=bVp98cHglxHf6ZYHvseS6zyTvvc7fS8K829UKN7/glvXl5bvLdzzqQiM4RN45D2Wut
         xMRh2XFP/1vs5JAJtbpZDbnrwzJnwdULfF0iNhvB13Te66Nffnj9nGFqRs7Adwv2rcUy
         sq8nl11k7YzhARxq6CLLO87YDXOeFoaZJRwV9KAQXYCo9eFAufN60HFur5t2yPdZKV3p
         ErYiJhiZPMg4xZNl6wATwgyUdb4lzgRQBxjzH0X65G4EeDx5X5BB4IG/s0xDEoSc8PlW
         wk1F4gLWEKtBleeh4ni/WOR/SgU3bPCzXOU4aoS2aOzAYKY23FAAI5DHtzRpuzGCXfXm
         xQhA==
X-Forwarded-Encrypted: i=1; AFNElJ/7Lu49AskyowsB+tViaJSYp9sX1VUPPjw8sfyra624UP4Vthmurw+Zw6UUIJxmb4xoLkhwRQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxM5IHEvr4fBpcMo7n9mHHtsI0pjASbeid1tGYzJha1ahyX9GJs
	opcBOL3FVaQU7/RI7AS5q4nK0hV/iNTzCZ7O8wRG6bL/Hr/G0/Xuq+YWTR35kMmhSNLSKpdPBjZ
	nXxK/0bHNAMG988FQBru4T1HXNBbhDEE=
X-Gm-Gg: AeBDievXgRZfU14QaJKyPoBVjq+5Zrg34/0zcKrZ1A0hn7X1uSs/ObPOFTnUUbZkFm6
	V+OXvfBKdBl8K9u7p5aPbZ7b20YWlfyCRpR/nHaclEa+bFYHWpJd/XvguvJ7wArJR/K+HkLCEEo
	7sMFpK4Oq+slKLg9uVXJCrOs2wB3eQfYmIn0h2JbKy7CZ+Hly+CAsL8jTghkU5fkhqlkrAW8npe
	NJStWvX5p/cgEJ4C+SKlu2mGXqd34Trnt0NLUxKEj/c2+AvIrsL4rFqjK24NR5YOijB43xQpu/n
	bZO6stE5bYHPgOYhvEZg7PK9SFxL8ZY703/EsWngbY10nlr0pD6iFPrO1Dl+mPy4qOevPCtf742
	Ey7vZ
X-Received: by 2002:a05:690e:418f:b0:651:c468:99a2 with SMTP id
 956f58d0204a3-65310a2bbafmr11722686d50.45.1776717479496; Mon, 20 Apr 2026
 13:37:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260417104639.2608008-1-tristmd@gmail.com>
In-Reply-To: <20260417104639.2608008-1-tristmd@gmail.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Mon, 20 Apr 2026 16:37:48 -0400
X-Gm-Features: AQROBzDy-6p2J796JPwwp_frm0FIgY1zcTHIOwEvqSjHrTNCfyTRMYOUjgz5Euo
Message-ID: <CABBYNZL-TZ_8XPpsH488Q8WtisfbX4jiBb_G0B3U-quiaYOAQw@mail.gmail.com>
Subject: Re: [PATCH v3] Bluetooth: hci_bcm4377: validate firmware event length
 in completion ring
To: Tristan Madani <tristmd@gmail.com>
Cc: linux-bluetooth@vger.kernel.org, marcel@holtmann.org, sven@svenpeter.dev, 
	marcan@marcan.st, asahi@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tristan,

On Fri, Apr 17, 2026 at 6:46=E2=80=AFAM Tristan Madani <tristmd@gmail.com> =
wrote:
>
> From: Tristan Madani <tristan@talencesecurity.com>
>
> The firmware-controlled entry->len is used as the memcpy size for inline
> payload data without bounds checking when the PAYLOAD_MAPPED flag is not
> set. This causes out-of-bounds reads from the completion ring DMA memory
> for the HCI_D2H and SCO_D2H transfer rings.
>
> Add a length validation against the completion ring payload_size.
>
> Fixes: 8a06127602de ("Bluetooth: hci_bcm4377: Add new driver for BCM4377 =
PCIe boards")
> Cc: stable@vger.kernel.org
> Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
> ---
>  drivers/bluetooth/hci_bcm4377.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/bluetooth/hci_bcm4377.c b/drivers/bluetooth/hci_bcm4=
377.c
> index 925d0a635..5d2f594c2 100644
> --- a/drivers/bluetooth/hci_bcm4377.c
> +++ b/drivers/bluetooth/hci_bcm4377.c
> @@ -755,6 +755,13 @@ static void bcm4377_handle_completion(struct bcm4377=
_data *bcm4377,
>         msg_id =3D le16_to_cpu(entry->msg_id);
>         transfer_ring =3D le16_to_cpu(entry->ring_id);
>
> +       if (data_len > ring->payload_size) {
> +               dev_warn(&bcm4377->pdev->dev,
> +                        "event data len %zu exceeds payload size %zu for=
 ring %d\n",
> +                        data_len, ring->payload_size, ring->ring_id);
> +               return;
> +       }
> +
>         if ((ring->transfer_rings & BIT(transfer_ring)) =3D=3D 0) {
>                 dev_warn(
>                         &bcm4377->pdev->dev,
> --
> 2.47.3

https://sashiko.dev/#/patchset/20260417104639.2608008-1-tristmd%40gmail.com

Comments seem valid.

--=20
Luiz Augusto von Dentz
