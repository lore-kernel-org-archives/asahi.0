Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A1518E370;
	Tue, 20 Aug 2024 11:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724153433; cv=none; b=rwgoAovw0ofUJ8n3ZgA/00VGHkscafD0aH/HmQJup3JQ2D01NWCPqiYzCx5DyAUx1Z+hyxjc+FLi6sADBmgLVtC7EAnmB1n/4uooacX8qwNxs2M3m97tT7hu5LjU6zKGl0SEMEwYXZrbO//t/t9TdG3EurDnmIicmBDsfIfbQHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724153433; c=relaxed/simple;
	bh=LwNxyJ8nRP2FJc1MWTutiqa/SpX3rNJs78aYCROn9FE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b1MUV/V+I1WSeeHvVA1p4Jlt+ISiB48ij+IFzfbafDAUo1VMyFAzJNM10lM6wuGoWOC9pZVUdNlOsofyN35gz08l+EQVeNkQXtB15/gZfeP/uMk3yYl0GSYvFZdn+Y6tVfd6L0aK+qwtkYPeLOg8mLX+NvH4VaKx4hdGx2ithdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a86412d696cso129085366b.2;
        Tue, 20 Aug 2024 04:30:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724153429; x=1724758229;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hSdQn5lqHbb7x/BQkgHUJ4Z5p0Igia2Fda+/Marx+2w=;
        b=RY/ydyCxwL9zoFbt4m2HTHfDuZ3qmxWXNef4QE7rEFlK6nqzkuy263NnzsG7goxrFX
         GLPGmCIJW+cmTiLtWeDd9EkR9L+jw7WEDNDeWT22UH9iS85OuM1zRJwATBD+kUgJts3H
         2uY8OUpQ/Oyx0Z3HdJbtr6OTNebQDG4d3nn0XHAD6iXjBM17Ps5k8DwsXuFd9CVc47fg
         +a5oxylkvV14L7kXMo+k5YY8KkGe3GGb0O9KDKJks5txhv9qPPnztBdTnZxOgh7uziNg
         DUL+fhd1Y1opofQRlvqoM5YFustud1z6q0P5BSLm5hacx+XUYlMZQQ6EH9GkRQJC/oy9
         yg2w==
X-Forwarded-Encrypted: i=1; AJvYcCX/KO1hhbs3sK6BFSGVl9fU8lxOOKg2Lb0ZmkgVArhrO6aFVhHbRCZHLS46v/dyeg86Hyv46hD66zuKN8B3xAFwARXPn+6YgUQc5fjQyuYeFjN7+cv3bOMeio/dB8LZ1ZM=
X-Gm-Message-State: AOJu0YzVUGrMAW6y3luaZPDK3NOh4rPkQKMIEjyndb0wsO75q5/rB5V+
	6Oo0eudOijfiPWK1xOYoTrJ3XuscDHg+/JWyZxezN6q85ZZdSc7Km5cJ76jk
X-Google-Smtp-Source: AGHT+IFbS8TXkzjdmPgjYCIQx78qrEAP1lLMjYhcuqC0ZBklgV483mYM3zGpVoQdO8IekiLHD9sdLA==
X-Received: by 2002:a17:907:7f26:b0:a7d:e5b1:bf65 with SMTP id a640c23a62f3a-a8392930dc2mr886533166b.21.1724153428783;
        Tue, 20 Aug 2024 04:30:28 -0700 (PDT)
Received: from krzk-bin ([178.197.215.209])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a838396d5eesm749316166b.225.2024.08.20.04.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 04:30:26 -0700 (PDT)
Date: Tue, 20 Aug 2024 13:30:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: Kalle Valo <kvalo@kernel.org>, Hector Martin <marcan@marcan.st>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, linux-wireless@vger.kernel.org, 
	brcm80211@lists.linux.dev, asahi@lists.linux.dev
Subject: Re: [PATCH 2/2] arm64: boot: apple: fixup wifi device specification
Message-ID: <2mqpwbn2je526zs6joxgcsue7r73ttpms72dntkup7hg7jkmmx@3lnsea5le5ya>
References: <20240820101216.355012-1-arend.vanspriel@broadcom.com>
 <20240820101216.355012-3-arend.vanspriel@broadcom.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240820101216.355012-3-arend.vanspriel@broadcom.com>

On Tue, Aug 20, 2024 at 12:12:16PM +0200, Arend van Spriel wrote:
> Align with the corrected device tree bindings in brcm,bcm4329-fmac.yaml
> which imposes a constraint that the compatible should have the string
> "brcm,bcm4329-fmac".

Additionally, please explain why do you think these devices are compatible and
also how this change affects working. Considering that previously these
devices were not matched by brcmf_of_probe() and now they will, this is
significant change.

> 
> Fixes: e2e37224e8b3 ("dt-bindings: net: bcm4329-fmac: Add Apple properties & chips")

No, no bug to fix. Previous code was intentional. If you claim there is
a bug, please explain what exactly is being fixed.

> Signed-off-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Best regards,
Krzysztof

