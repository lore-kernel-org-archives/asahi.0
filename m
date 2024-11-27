Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1EB51990DD
	for <asahi@lists.linux.dev>; Wed, 27 Nov 2024 10:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732704560; cv=none; b=HnLX6O1jP7P+zfMAilLgw1AYgXprf+ze3P8GEfQ4qsfL4zx+OTjbbbuT71dDoKun8kz8vFiuj6k41ihGckM6UotYPUe3Hi7IhTL/UcAY5MYu92UEw+336vTmOv47LGskCzCoWRkEKVc3DF4dKFZVhEbmEAUoptk+4z9+1JjOf8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732704560; c=relaxed/simple;
	bh=zj3U1IZYGABL9V0QZyz6/EdJvXQoY7bKYdXQeHobgQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eFeLCUbU0FET8t4u+HAkB/MZx1g8+2f25Fu0RY7CmX6N8VGYiaN4VANJsT7xOYdyT87/ES9wNkpkZ/zWK08IX2Q4dGxuvtuT+mpyXS8v3WaJ3PYseG8lsAeL25lkE7kJJgoWhRlNgWXzFS0veTeuSWfbnqw5EcVPu+1a69EA3Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KOA8yOR1; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KOA8yOR1"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e3889bc7ec6so6291392276.1
        for <asahi@lists.linux.dev>; Wed, 27 Nov 2024 02:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732704557; x=1733309357; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iYyR3yXYjz0YbNKKTg5cy3mGbrW5Do8TFUwFkEGO9kc=;
        b=KOA8yOR1m0oYw0GcRyBTMx7QW62rT93FYd8fxt5w5w3Cx/KT1+DNPiP23Jx1RkYAJt
         CBb0Wy787Uig9a50pxvLny+7a2JKzCdSJxwa0xU7ZESzoK5DdMuvPJqG3xe7rGn5wvD3
         uLzAOmDIApVJS06MQuQeZrh67s6i1VhyDzzGKvRSUvIeeeT4lj/DuMsOOZLs7ViOSOa3
         J6PYvvDWf5SwD+PghIdfUEAdwEwiPcm6BUqqCKmZx6cwTPVuhwpaCVIeAV0jFh96RXRU
         tF50ovyHwe/p17xuqZUb2csXkIcwWcdQZZbtIF+mUbBImMpeWoxPDjv7faCPxcFF6ws8
         BPgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732704557; x=1733309357;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iYyR3yXYjz0YbNKKTg5cy3mGbrW5Do8TFUwFkEGO9kc=;
        b=wDTOBr0D8UxppCHn4uTTAIh22HXbF/P0thvJFFdfvvKvNgAOYRxCyLLFrjXgpTwHAN
         O68V8612oBR2F6iakfquPqKaX+bBQ8fu8nUCStOfChga9Q4ZFCJeuhLtZG6BDV2dG3bg
         sDzm2PSLw3aqGe5pC5WeT5TW9b7qcmIeCYBn56J/fcqCnZBWWy2UcFENkmtGVexdNAxb
         pvLwibqFdd6s1gfTYSGs7aB6k8pRdw5kvqXizTIfzSK4yrDCFdz9lUlQRosDbp2251ir
         X39gyQv2siWvqk/o5kclLfXzQWctm58raQlk40owjH3mCh60aQ9u+9zXy0HA+nDdoQma
         xMbA==
X-Forwarded-Encrypted: i=1; AJvYcCUPWd39+kjt6GzPGcpRkVPBImBjrT1AJJnkgGYYUVlRmfXeqvqbDstDxcxjzz4EOdR1DsWpaA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzPQZ2EpW0AJ1OpKKltK9XVAKg24DYdLiTYzdvsAplBOYNkZxQO
	vhGWPG0uXcMNT8CrEvn7KHYt0EFW7Reu2HHf3aTVTZNUKv5OBkkOVc/glloumwNqUw367jydEyf
	Rt9oGBmfj8v5+cVK3ZsBHKCehZAPpZg==
X-Gm-Gg: ASbGnctN+mP3sVrVBvZdDhMLaEEvHPD1d3n7i80dlU8CpSX46+PvVu7QVbeWQs9/DKX
	j08EMjl+gEN3wch3mdR9uVwPffT2AhniY
X-Google-Smtp-Source: AGHT+IHuUBgbeWipGcuuSeVvP/LgXH+YzaHYRbIiLarVanu1jwlInw1N972fZqN73ZU9w+/mGXihRtV+AM8sbsNIxlo=
X-Received: by 2002:a05:6902:1588:b0:e38:b889:7efb with SMTP id
 3f1490d57ef6-e395b897916mr2246859276.21.1732704557583; Wed, 27 Nov 2024
 02:49:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241126-z2-v1-0-c43c4cc6200d@gmail.com> <20241126-z2-v1-1-c43c4cc6200d@gmail.com>
 <zwdpx6c6qxm5674u2sea5sgwdd2fwim4waijb2qvixf62wrshb@yqs6zurtf7ic>
In-Reply-To: <zwdpx6c6qxm5674u2sea5sgwdd2fwim4waijb2qvixf62wrshb@yqs6zurtf7ic>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Wed, 27 Nov 2024 11:49:06 +0100
Message-ID: <CAMT+MTR46HbUJWQOwG+MY8OffquekynUs_BRCbuAosLrmc+smQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: input: touchscreen: Add Z2 controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 27 Nov 2024 at 09:47, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> What is the meaning of these two last compatibles in the list? What are
> these devices?

Those are generic compatibles for everything that speaks the Z2 protocol
multitouch is used for everything, as this is currently enough for the driver,
while touchbar is for userspace, as touchscreens and touchbars
need different handling. This specific schema was suggested
on the previous version.


> > +  label:
> > +    maxItems: 1
>
> Why is this needed? I think it is not part of common touchscreen schema.
> Drop, devices do not need labels - node name and unit address identify
> it. If this is needed for something else, then come with generic
> property matching all touchscreens.

I want some sort of a property to contain a human readable (ish)
name of this device.
