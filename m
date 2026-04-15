Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026071A0BD0
	for <asahi@lists.linux.dev>; Wed, 15 Apr 2026 12:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776256449; cv=pass; b=tt1S4dWyev1nzLzUSCUSvIrW+3MzITBRxM0PcUv6EVnP5vuQdx3wcwB1szvzxsVsaWH4ZnvXEc7fovKIS8YnQyR02Ih/g+M45xOYG7KWUgvw0ZsB1YkgiXzTLy2SQ6t3wia8WaEGUKllBJsM23UppKhmhbMtmHiDUwIe+U+VYzE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776256449; c=relaxed/simple;
	bh=+h8HlJDwvYNw5rua/v6Zk+eoY4fhxZ1OcFHecBDCW7U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GDCI2mTUdZsU72h+SlJ271ezCnwJILvuP1gqKnX02vx9FhjGenlEt3XaaN74W9No9EAGxiBY6QBgwYS0XkecUUnGQC6vm69Roj/VDVvoG7Ju4p5TLqHGXBUAx8G/gV5/aKpxwK1vehEfSbwwctQPDHlXlLhxf3ZH9SIvBy7+U9g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gXb0JKZ0; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gXb0JKZ0"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2b25cf1b5f0so44774395ad.3
        for <asahi@lists.linux.dev>; Wed, 15 Apr 2026 05:34:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776256447; cv=none;
        d=google.com; s=arc-20240605;
        b=ABfQd+urIetbOIjUry2tELwdU8ekA93brIcz4VrUsXJWXOLTfIUw+/2liQ+7QPbyy2
         UHooPnhhQjrEVDE3kq8zMv644V4s+db4Q+LzeN86/KqUK0LinXZJZwBstyy2IlYr7Bi/
         5ukNbzB8uzJNW6y9oj/Z95Fa+JBGmlCguTpIZE0exJfLxrQ4GXmJd9O/Ly1oQ+Bpcd51
         S0u9sIFD0TO8aSS4biWiyg+2Wf+7F1ibnzu1LWEGwL8Afq7G8AXOtetm/y52ZGQehqJG
         iffyqerWkJg0dri/BlIrG8pYjDfhjtWH15tJ2a3nNIfTnHb+22KKfU+yL7446i9Z5fms
         pAYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9v5h0WGA6GciBmySthgQ0LZ+Ql4Vyrp/FXGCtEgGi0I=;
        fh=hCf/qpwC9Yk1CP7ntWOOeAqyw+9LeL5vOFp9KuB+o1A=;
        b=AIFDiYasdk+5ko2lC5vx9crr8PJKE+Zeh7zP0688FzmCwt+GzXE/4O7lxB9EBdDUAp
         BQyjEotW0GXejCQEsfg40G3LujYKq1rBMB3Ar4rxcFTAH53MtuA1c9Da2IEIrbA29piG
         TQViO7rTCQORnR3FbEGTCc8YzlnyKx6ZWl6Enl8cGiffT/QmiP7MYIVfzsNkHa3AvuSR
         +hxr+mTn3mxQK5viU77SFhD91Pw0s6P1WHz/czi8T934JhSLnU4ZmeCv2hbK6pqAqAa1
         +oV06+6NukH5Txq07lM9HCt0Wlo5OWbEPHngKcO887nc9Qg0GTCe6PRmtYtKpUe8OUvM
         H2Wg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776256447; x=1776861247; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9v5h0WGA6GciBmySthgQ0LZ+Ql4Vyrp/FXGCtEgGi0I=;
        b=gXb0JKZ0bqVb8jQlP2NyPfF4URMwkn0ON5dS/VDJYT0CwyMkijEb+vDE90pTs+1yC5
         c6IvBx0dbqn0mHEIVMZWY2Cg0pnezS0vdFvz3Y6mP1oyNUql1nl5QJNxz7rNJ4fyswq3
         klgkpbY6uaneWZ7Y2++ZdR78RjDiAkgT7bn3LBK23CvPDfvEL3+ifD0YqkNnv+UpJkmx
         EeiKS9a2s+2wuOOO9S1CC5OVXkxJRxUJQrnws6nejzHNy5o9+KXyjcfxkzKqpalADJHV
         b55vXMlWznTeqI8rdbOs/OVsQPTbsyLWaerCkRozi6qTbtGp6Q1cdD7Zg8nc6Ec6vrn8
         XZQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776256447; x=1776861247;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9v5h0WGA6GciBmySthgQ0LZ+Ql4Vyrp/FXGCtEgGi0I=;
        b=tRf3xLwcnePPRHpzQUU9gDK9Qm+cC9rmWcUNRZZCs7FXTNd5oZf8l/ooPAWnDndUIP
         uleinY3S4zCZwwcm3YXivxXNv6VVjVHN26ShVehhL+SA2EyAcpv+1L3MTBCOsXpc6OBZ
         Jh/9HYKj3SqvHGUoWqnzkwRzMc7RbzzX8zq3NkfgswYGIkqCixdGt7Bw+jskf4feLVQr
         d80ZjkYuvtt31KwMpa72MVpaKW/qHPRHVjumEiTBbJ127kOZiEwOMnjWUoOOlTBh7aaI
         lX9Y062JrAIV2LmPKP15wRKDNghv2hYv2hOgx6XNv43skJebIfx4UGx3MZ2AKfuvcGKV
         CvbA==
X-Forwarded-Encrypted: i=1; AFNElJ/qWAVqVIclOf8gz8TRtRNzd3lLdTSPbYT4vqOuk3hcobmY+6zg8U3zvMBdcZ1+KMb4Rhl0+Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8Rg/qATuPvXm1rLKPeOksojnKpPiHLE98w+gq70GyF9t2RVjp
	znRXvFQgFq44nNf+QMtFAaenK0Hozd4mKIeZHonGt/ovnKzh79Pfa5bKmwlTA/pMoyXltxzKHsY
	h1Xg410n+TAV1sje5GwEIWF67LB9muNg=
X-Gm-Gg: AeBDieu6BXuGC65fxtImQ5Yxhvr1mzmXWtEtYudq9RSnYaKOmIXKBOTMTuYoIENUEWW
	he4aBrYAfZ0Ttlvqhg+pxMJR4wF594FaUqxVxUoakI1bV9feHFCwSsyN8cl/cfITaJFBHJi2WYx
	b0LwV5EdQ1ADomBcvtZC7LHz3rPTM9K05j1HvNrhBbvfGMZ4wpbVHHrpVWwDj+12UATIFDMBCPD
	CZRWzi8ZKMuxOiOdVLfq2SweKPvD5VP8YvEUKVmUDAJM5PAjm3+5CdRtOeOd32P7pTfgEDuy8pc
	1D+ai5wlWHA9Eu8NsZieE0ra4IxQ0A==
X-Received: by 2002:a17:903:ac6:b0:2b0:60db:7927 with SMTP id
 d9443c01a7336-2b2d5a168bcmr221211305ad.28.1776256447117; Wed, 15 Apr 2026
 05:34:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260407-brcm-prio-v2-1-3f745edf49af@gmail.com> <CABBYNZJAEqwfTuVqbFAnx97HBSjcwn3Hb+y+r4r2C=MMPxFoDg@mail.gmail.com>
In-Reply-To: <CABBYNZJAEqwfTuVqbFAnx97HBSjcwn3Hb+y+r4r2C=MMPxFoDg@mail.gmail.com>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Wed, 15 Apr 2026 14:33:55 +0200
X-Gm-Features: AQROBzCJwjrc1bDi-TXhcjD-wf65qYVngCDiW7f3UZYU9kWetoIg3teCKW6NkdA
Message-ID: <CAMT+MTQ6orj5tpiGL9hz8m2TGiBjA-9D_0e1iLt=_dXBFHcOgg@mail.gmail.com>
Subject: Re: [PATCH v2] Bluetooth: Add Broadcom channel priority commands
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Marcel Holtmann <marcel@holtmann.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Apr 2026 at 16:00, Luiz Augusto von Dentz
<luiz.dentz@gmail.com> wrote:
> > +       if (sock)
> > +               set_bit(SOCK_CUSTOM_SOCKOPT, &sock->flags);
>
> This is more complicated than it needs to be. I'd just add a new
> callback, `hdev->set_priority(handle, skb->priority)`, so the driver
> is called whenever it needs to elevate a connection's priority, that
> said there could be cases where a connection needs its priority set
> momentarily to transmit A2DP, followed by OBEX packets that are best
> effort. Therefore, `hci_conn` will probably need to track the priority
> so it can detect when it needs changing on a per skb basis.

I have tested per-skb priorities, and unfortunately, this does not work.
If something tries to send a low-priority packet (for example - a volume
adjustment), a priority drop causes the same kind of dropout that is
caused by scans. It appears that the only way to make this hardware work
is to set the entire hci connection as high priority for as long as it
is being used to transmit audio.
