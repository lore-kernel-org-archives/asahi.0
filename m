Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05B52652BD
	for <asahi@lists.linux.dev>; Fri, 30 Jan 2026 23:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769815833; cv=pass; b=KKotMhkTLoZcW9i47E+umzyeBM2rubspRNBvhHCkCn6qneqPejWeFgxepxI/CK8xunbQvPU7IoOMbCtJoGn29ThBHTlhhcYE3O+PFoeGRt0oNbfmzUGgOBTNiI27MnfQks56L3Sb7+v4OuddcAcPWtZrRHacYJcjXy4beVK//xU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769815833; c=relaxed/simple;
	bh=rT7JMLQZVTloQNPuDwEaJYqdWaSBLoWAOtMrpR0m480=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oz2LA4xs8w0Ju/pIV1GrRGFWPay0WLL4IKj1T70wVdEssh5jD81OUzAYRACMu8JwOvgsfmSRnOYAvwNiE3oAwNqhmPep4F04J6v4RSXWiWHx5kc6tl5j34XP2SNIyJzlhQR8p9Cx++Uo9sKnEXmGtWkVQuTi8+QV5LLqMkf2yyE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jNECf279; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jNECf279"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-78fc174ada4so21956747b3.2
        for <asahi@lists.linux.dev>; Fri, 30 Jan 2026 15:30:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769815830; cv=none;
        d=google.com; s=arc-20240605;
        b=DELu/hAlCZ05AEkHJBGt8Wv/WOXcUQNHKshlTLsSUvHB69O8dlesqdwIPbHRog0Ztw
         xyfPdWgF7+Wfp70Y0T7BQ8DQ3zdUeQUUVb5qMLeEFgzAUOiVX9e2xh8WRS1ekPZy96Nr
         depIDTsUm5QsRwrMoXNUUV/oh1ZLKIjskoyrHJvPkKv8D6UTWYkkEFM7LUebhr6a/m/7
         FkIR5c7PECVLkE4RwhSVuUwMtTYoXnpfWEDVzjd6GvaL/fP87ciWfdi/NzdD4uhpwMCP
         tsQ1fJFVk10LBpkunQRbrg3DgvxyWOr652J8PY1gKBBhKjBy7BeYvfVHcW2S99loBzy0
         viGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3bpaxfJsKwpZBjFf2pjQJex7pcwV+ph+c/+CNE1sRVg=;
        fh=Kv/xkFenIahAyFfBf95Lbi/QCXVhFp/zFv21i1sQrwU=;
        b=AblEzOhffOFLE0YsQQVAof5jq6TXXXGmM1bXgk+K5ugEh+2iz204XTWoc32w1M6/Sb
         hyxs2vSnaQaSmEhUhkmdO9gHnzTWa9J+roiul4edaiZ7oW3dU7gpIIZpPCkD6rsHs52r
         kDLVGriSveupY3yXtU2jAZ2ctbNn/QqMuSFqTBFdY0FpZRif4s5NxXfYB5UdxbG6kl5W
         jAWVZYaxv+gFTMG3Pksn/HoIveEWaNuNX+JBgGMYEaE4AGDeuggBtb4FyvGAtW0q562I
         yfxf9pl22Ren7+YSIE4k8TmIx6cGTvNgoujuTVO8B8XtslJIOVoM0eyaz9+lyIs9hDyb
         oGAg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769815830; x=1770420630; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3bpaxfJsKwpZBjFf2pjQJex7pcwV+ph+c/+CNE1sRVg=;
        b=jNECf2791mb3FWOyOXxlQsItj4nfUexPOp/bAKN5AFrwerOa/AfqOMPJeGYL3wcC6k
         fn8AJ8zfLobd9+IqaB7QmaxmRE5CaN/rLBRUCOZb6+ClnFBGXNBn5T+Q+MmgNTFNNbU+
         LwZaZRzQYNI2cxe56g1TNa+rSKXDbd1y5sNmFl7YMkRj0N/HVkXAYbpoGQi0m7zpSKG0
         ITiQUw+Wl/nR+kG9vXIJYhhF+ZF/NcauS8KdNMBXZlAH4gjWaTBrUMRjfqp2fOiJb5hb
         E4/x4VEe/WUwNsenAFwH88D0ExLORkMRjyBnVHepkgjILmv73UCrq2vzvVfoBeg44uFb
         l54A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769815830; x=1770420630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3bpaxfJsKwpZBjFf2pjQJex7pcwV+ph+c/+CNE1sRVg=;
        b=AVSSGwDoE/9rC/yoK6or5OX4iYtOUYzfV6/efHImJgW+sjynVOMKnFARW0lM2GZutJ
         VfcbxTeIkUmf7w3ZTEiduAWJY98MTMPTqIuFVimrHnj1LVlFYwHVJMrbXFtA2UcQR8JZ
         DKZzfSO8cd8FoZszwX/JW4At5OteGZsVb9g6qEpUv6hylp8soGUsBFukoe4Oa5fsQ7ww
         MFVkH3MII7EYtRnKJwO2lrLW+kiydnHD1J6BUTP07AwQFnD3xQn8FS7JmS6E3Pk81wt8
         dhz3aKgunDTg3CmDOJUOWpAomv7cTp3KUranKHlE4jsoi9iNFhEEqHa92PODdKTzugQ2
         9wWA==
X-Forwarded-Encrypted: i=1; AJvYcCXyqZvlqbR+TcpFomRzFtzRKudoO61+FrW1P8SDzzQu1b/TgMYAuWp7wMEKf4KFL3+2eQLKdw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/Mr9narpId/fIPNKRx71z5Zy5d8zfhxm4SLl6InR6FYeWaA2u
	UzjhdGhbgV5u+h80PCS01PPF3N2eqMrPPp4YTRf84D0gO857XSeaY3xfyGXssuyCbM89cEmaZJq
	m9mKsRaaiN82zWWFp9ksSjDuoYxEl98I=
X-Gm-Gg: AZuq6aJKW9MwdxtDo+p0bwDHVPwf03s9q7DFy5ZWcmTMPkw/2yHejT15oiKGclODlK6
	LuwDnl5pHWSPT4jrDu2iDWQQBebgc0o2Iok4+z9AfqUiySz3q38ca83kOuGZgyS8T4D1VfZvmEG
	jVBen5m/k0h6jzK+ulBZKTBq/wAUtCZ5BcG8+LqJOTgSBcvDzQA2uJuDxH2bI5CCuwyGtB9+adR
	Ox2ao6GRMByeruBVhmws9ePF5whcJD3zCYKFZ7i3p5ZElQpsLhjxzt52YpcmxCiPwiJt1Oj5Dhn
	TmSP99C/28q3AzTcOLj77VR8jfjx
X-Received: by 2002:a05:690c:38b:b0:794:8cde:3ef0 with SMTP id
 00721157ae682-7949e025a14mr36842957b3.61.1769815830402; Fri, 30 Jan 2026
 15:30:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260126-b4-macsmc-power-v6-0-9861d4070f92@gmail.com> <aX0L6Kb63My-PsGd@venus>
In-Reply-To: <aX0L6Kb63My-PsGd@venus>
From: Michael Reeves <michael.reeves077@gmail.com>
Date: Sat, 31 Jan 2026 10:30:19 +1100
X-Gm-Features: AZwV_QgJvifP9ntug-W6Gb1lAE8Nl6_8Gyela5QkjsYmR3oHPckI82eNoFIRm5E
Message-ID: <CANpmGNsCC09A4Dgy0NMye83g1c22x1RbOG0KRpvDryPW7H1oNA@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] Add Apple Silicon SMC power driver
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Hector Martin <marcan@marcan.st>, Joey Gouly <joey.gouly@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
On Sat, Jan 31, 2026 at 6:54=E2=80=AFAM Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> Hi,
>
> On Mon, Jan 26, 2026 at 10:16:55AM +1100, Michael Reeves via B4 Relay wro=
te:
> > This series adds a power supply driver for the Apple SMC found on
> > Apple Silicon devices. This allows the kernel to report AC status,
> > battery charging status, and power metrics, and modify the charging
> > behaviour.
> >
> > The first patch adds the driver itself, and the second patch wires it
> > up to the MFD core.
> >
> > The driver is based on an original out-of-tree implementation by
> > Hector Martin. It has been refactored by myself for upstream inclusion,
> > including support for newer SMC firmwares, devices without batteries,
> > dynamic property detection and improved state management, among other
> > things.
> >
> > This series is based ontop of the current linux-next at time of writing=
,
> > the exact commit hash is listed below.
> >
> > Tested on: Apple M3 (MacBook Air, J613)
> >
> > Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> > ---
> > Changes in v6:
> > - Add FS header include for emergency_sync()
> > - Link to v5: https://lore.kernel.org/r/20260126-b4-macsmc-power-v5-0-3=
02462673b18@gmail.com
>
> This fails to build as module, since emergency_sync() is not exported:
>
> ERROR: modpost: "emergency_sync" [drivers/power/supply/macsmc-power.ko] u=
ndefined!
> make[2]: *** [scripts/Makefile.modpost:147: Module.symvers] Error 1
Thank you for finding this! Sorry, I didn't test building as a module,
only as built-in, I will do this
going forward in future. After some research I've found
hw_protection_trigger which is exported
and will emergency sync and power off (just like this) after a
customisable timeout, which
seems suitable for this usecase. I'll test it now and submit v7 shortly.
>
> Greetings,
>
> -- Sebastian
>
> > Changes in v5:
> > - Readd cover subject that mistakenly got dropped, apologies.
> > - Link to v4: https://lore.kernel.org/r/20260126-b4-macsmc-power-v4-0-a=
a2a682ca650@gmail.com
> >
> > Changes in v4:
> > - Restore Hector Martin as primary author for the series.
> > - Restore downstream Co-developed-by and Signed-off-by tags.
> > - Add Reviewed-by: Sven Peter <sven@kernel.org>.
> > - Simplify MFD patch authorship and remove redundant tags.
> > - Fix probe return value being overwritten by devm_work_autocancel.
> > - Return -ENODEV in probe if neither battery nor AC adapter are found.
> > - Add bounds check for nprops against MACSMC_MAX_BATT_PROPS.
> > - Refactor macsmc_battery_set_charge_behaviour to remove unnecessary re=
sets.
> > - Improve critical_work shutdown flags and remove return.
> > - Add comments explaining SMC key firmware history and flag meanings.
> > - Clarify event ID descriptions and restore BSFC flag comments.
> > - Remove redundant dev_dbg logs for missing battery or AC.
> > - Link to v3: https://lore.kernel.org/r/20260115-b4-macsmc-power-v3-0-c=
236e09874be@gmail.com
> >
> > Changes in v3:
> > - Rebase on top of latest linux-next
> > - Drop charge control threshold properties.
> > - Switch to devm_work_autocancel() for critical work.
> > - Add platform ID table and remove MODULE_ALIAS.
> > - Simplify property array management in struct macsmc_power.
> > - Improve probe error handling and device pointer usage.
> > - Minor style and indentation fixes.
> > - Link to v2: https://lore.kernel.org/r/20260109-b4-macsmc-power-v2-0-9=
3818f1e7d62@gmail.com
> >
> > Changes in v2:
> > - Added Reviewed-by: Neal Gompa <neal@gompa.dev> to all patches.
> > - Fixed Makefile alignment by using tabs for the macsmc-power entry.
> > - Upgraded physical battery exhaustion log level to EMERG.
> > - Downgraded software-triggered orderly poweroff log level to CRIT.
> > - Added check for CHIS key to skip AC registration on desktop models.
> > - Link to v1: https://lore.kernel.org/r/20260105-b4-macsmc-power-v1-0-6=
2954c42a555@gmail.com
> >
> > ---
> > Hector Martin (2):
> >       power: supply: Add macsmc-power driver for Apple Silicon
> >       mfd: macsmc: Wire up Apple SMC power driver
> >
> >  MAINTAINERS                         |   1 +
> >  drivers/mfd/macsmc.c                |   1 +
> >  drivers/power/supply/Kconfig        |  11 +
> >  drivers/power/supply/Makefile       |   1 +
> >  drivers/power/supply/macsmc-power.c | 852 ++++++++++++++++++++++++++++=
++++++++
> >  5 files changed, 866 insertions(+)
> > ---
> > base-commit: ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
> > change-id: 20260125-b4-macsmc-power-bb30389e05f1
> >
> > Best regards,
> > --
> > Michael Reeves <michael.reeves077@gmail.com>
> >
> >
Thanks again,
Michael
