Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795654412;
	b=1XoezQxUf0ACvgcF8nkZGFr7COMA3anNJCbXjVchb/flswLjQibTy97IKAoyyVvOjAb6
	 Kt3PdiPF89cyQ7LfL+1WJCDQ5qRHwjeCHnEjAVos+SKlLTL4lEEpowHF5XYIMkYoFtqyW
	 Z9BHrLWoBrXZ285Q8JDAmMS6a0HRZ9P8FkR7NiKPh+IcNLdFEB22DptXtgoiCFLyM1VOR
	 2jbad46ljO7bl+fPwbPL81VK7jSuU8L4i8iE25cYJSgIF0J184H1lqjuxwRgk3JYsQ739
	 u9VXBIXTOY0z1mB0Ei/nCq3xYPG6tHgSZIJcTNhIhGeEJ84psetm93cuqGN6sm1bnAA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795654412;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=QKS1+fYbIgC1lp2lpexILzH3dNKnXoeC+FajXVjh8j8=;
	b=it8IIZKHHdLvgTT+WjbT2dcjysiePefUpN9YXIxbCGxbPpevH1tNxEGfoNy/u2YcUW85
	 /+hXYr+Rb9cNc9ptdZtwp6asywcj6nYx0nWAkt+ONpi0nJlTyjlsAPX3Dtcl7pwej/YHc
	 RmPaw/6JRzu1d0Cw8iCL4n06krbvJmtoEF0y75ghZFgUo4VWZton7RX4HuzK3IaJXX1pn
	 tYyBxWahrbncF3QyB95hJRD8VSDkWrDx0xqsIqu+6zjXkw+Cpppg0v8CtvVWWqjaJusiA
	 IsmGjRlKEcz3FaEPP0lAZxv6NXKReJzXV0JjSI1JyLp/6CVLCm/mYYfaCPbs+E7bvyA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SBOeMveO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CDA606A684;
	Thu, 26 Nov 2026 00:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SBOeMveO
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795654411;
	b=up2ewVx1Qr5l1QNj02jZa+AjAmKWOMgBbet3mCGbjNbtdmZd7kOmkiXAKOqZG4ILM89R
	 KqmhFNFbTCC9Zgew8Urg3Xd7vfvcCUUsD7bZqjXcUXfgdRkcj5gVYA400guDMGWgw8RPd
	 40VRKHMyf107J/8Svfmlo2iMksHh/Umk1KwUuzk+vRg7jiMmCwjkmlT9Yf1M8Ck/fHsJP
	 ClCNV4/71HmUJsUAjfcqmKEB5zxoFl0mYpO8qi24VWuQvj2xPiH/J7AUBoCbaEb0A1OU1
	 NeQqiGKEHJlS2wKwy9FGH8q2Ft20JCN5NYC2LL2Z427rpy6tgYlYsEL6Sb5M0UlnPEw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795654411;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=QKS1+fYbIgC1lp2lpexILzH3dNKnXoeC+FajXVjh8j8=;
	b=AVgw1INxeM2V5TWhDtJrTyFbFatLXq5OQDraec5A+PBM8ETt2Tw+chUJ3zzDQppkTChd
	 icINyO5KU7aEmnFa6yp7IPfwxpuJEUXKOf2XXZZtNQ5Dym6fGkeZYiH1MsJInMAoo4K56
	 Fx6g7RNX+KhMji5CO+pAZEAHkvlDRUQlsyKjYguo6zXbjzX8lFEz+A5hGw7TLfxWhzVbr
	 Ac3N7CA2dnBy5PlaDQ2K8ZYlGPQQQWvIezQRPUnTPbq//tU6ew844l8yWADkEvJx8fuaq
	 5cliWcDiCPLBVdDshtPugjFqSyF9/onY/cUMrw9kMyXfxWGXsFSgQd1/O69c/8aO6/Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 633DD1F000C0;
	Thu, 26 Nov 2026 00:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795654411;
	bh=QKS1+fYbIgC1lp2lpexILzH3dNKnXoeC+FajXVjh8j8=;
	h=From:To:Cc:Subject:Date:Reply-To;
	b=SBOeMveO8Co5UR7xEG5+ppzKZC7LZTaLBnjskNaNV+4wGIV/KDDS+mxowPdLXJtUS
	 u299kvnq2tNOWGlUUHu5FmxDlavI/4olX3ybXyNR1FuMLUdac9pFwR+Ew4VvQ/JHxO
	 CdGM8dDtKvoMHABcDVtwI+Krp2X8nGI3YGbwcBr9C4Bs+zaRu9jjcb9l+VS3NdJnWw
	 1GMmoxrNvZquaeHpnCBbKrhU5PFJYFyTllL+hQarO8DFpqsUX2bdGxFx6u3zJbRZhc
	 1KPz9evruI3Aec2/z6Ax57MnpWCsX0QPYplV69ppBqxa+Tzu/Cs8Ox4gGIkXbcbcQT
	 Bzf66wYYdTprQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E34334D11C;
	Thu, 26 Nov 2026 00:53:18 +0000 (UTC)
From: Ilia Snezhkov via B4 Relay <devnull+iasnezhkov.gmail.com@kernel.org>
To: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com, sven@kernel.org, j@jannau.net, 
 Thinh.Nguyen@synopsys.com, asahi@lists.linux.dev, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] usb: roles: serialize unregister against callbacks
 and fix dwc3-apple lock order
Date: Thu, 26 Nov 2026 00:53:18 +0000
Message-Id: <20261126005318.71705-1-iasnezhkov@gmail.com>
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795654398; l=1429;
 i=iasnezhkov@gmail.com; s=mindone2026; h=from:subject:message-id;
 bh=/KhVzA8eCb4chveoLC9MB4tLBld0vlSj58HKYp0F95E=;
 b=hlaqSQRedY9zEe3UKvea/O2DWIUYTYqp5KOe4VrM6OWsfHIZqmZOKA9kxNZFYhuU/sSUBpr1F
 t1QQzl2V+2HAOXQ9dS33qX2Dn8FL5b3srLlUFNK3X79wYvv2CnLHCw2
X-Developer-Key: i=iasnezhkov@gmail.com; a=ed25519;
 pk=hQgXfiWi4ukk2jh4BHu1vRVhg9BUivo//AFp50AKMag=
X-Endpoint-Received: by B4 Relay for iasnezhkov@gmail.com/mindone2026 with
 auth_id=1643
X-Original-From: Ilia Snezhkov <iasnezhkov@gmail.com>
Reply-To: iasnezhkov@gmail.com

This two-patch v2 series fixes the race between
usb_role_switch_unregister() and concurrent usb_role_switch_{get,set}_role()
callbacks without introducing an ABBA lock-order inversion in callers:

1. Move usb_role_switch_unregister() outside appledwc->lock in
   dwc3_apple_remove(), the only in-tree caller holding a mutex taken by
   its role switch callbacks.
2. Serialize sw->registered checks and teardown under sw->lock in
   drivers/usb/roles/class.c and document the locking contract on
   usb_role_switch_unregister().

Changes in v2:
- Audited all 15 in-tree usb_role_switch_unregister() callers and
  confirmed drivers/usb/dwc3/dwc3-apple.c is the sole caller holding a
  lock also acquired by ->set()/->get().
- Added patch 1/2 fixing dwc3_apple_remove() before patch 2/2 takes
  sw->lock in usb_role_switch_unregister().
- Documented the lock-ordering requirement in the kerneldoc of
  usb_role_switch_unregister().
- Link to v1: https://lore.kernel.org/r/20261125234825.94733-1-iasnezhkov@gmail.com

Found and drafted with an AI coding assistant.

Ilia Snezhkov (2):
  usb: dwc3: apple: unregister role switch outside appledwc->lock
  usb: roles: serialize registered checks and unregister under sw->lock

 drivers/usb/dwc3/dwc3-apple.c |  4 ++--
 drivers/usb/roles/class.c     | 19 ++++++++++++++-----
 2 files changed, 16 insertions(+), 7 deletions(-)

-- 
2.54.0 (Apple Git-157)



