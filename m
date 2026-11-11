Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794398583;
	b=G086TqZwf7HEz9jbEkbZdPSatBqrZV2QFGb7vIAx3HE4z39xQUHc8H2wkaf2Wu4M4PPs
	 992J0LCtzLwz6irnWgFLI7yLB+eeXzo0FRWz1x8WQDyBMGOiRAoAm5kXlw+PIyU3Vj5NP
	 GSKGU8Q52kRrSJHsBCBlb4vttGp4fwEwKT9wG2ij1rKGL4Ao253CMPefXYDy7rrCHOmpc
	 HqfpzhX3oQoKwZm3mqG0grZCSTjXLJZYCpMnHYwOoy3JDgGMZ5IA5oZADIp7u34vgbai4
	 Oq2fySWqUnDaSpTsAA0wjyvtjjyYkEdD7Y04xosFsyaTPbN74cQsH0ebn3F1ZeDamQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794398583;
	h=DMARC-Filter:From:X-Lima-ML-UUID:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=uCuXL4k6bXz1OMpQSYuglr4LnZB1D5NcI6zeX6m9YVw=;
	b=n2Xm8d+Tg52EIHnmBjPND7RVoDbEECienAF/sjbcpAo+DKkzhACSfVVNx86cQaKmTwEV
	 aH2GTSa73OXXQmRhT/1ZA+f11UNF8gIAx3N/KwquFukPE1KhM5oSlq7S3JdzBGB8wQCpk
	 jeZ/OXiXgOLFsxDRxNUCnFylcZUR563yi/W5KoLhQ5UyaG161NLYKRoUhYcZ0HnI/R8VV
	 4/yfiQfpqLdsYFiSbHIqe1S9ido7sJXhRoSITsRGH5ZT5te17mL1T2ODN4Pne6vLxdnk2
	 Xc+fD/fk198rikEwnfUM3xCcyeFT3zAfkWht9Tdn+ZC+0FXawfgBUO2I+AzgJQYvR5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=fENlUVZ+;
	arc=none smtp.remote-ip=91.216.248.207
Received: from mx5.mail-out.lima-city.de (mx5.mail-out.lima-city.de [91.216.248.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A83606B605
	for <asahi@lists.linux.dev>; Wed, 11 Nov 2026 12:03:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15A83606B605
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=fENlUVZ+
From: Andre Eikmeyer <dev@deq.rocks>
X-Lima-ML-UUID: c5a54213-9cbf-48a4-8e1a-0957c13c7efb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1794398572;
	bh=/2sigmfXWkPzluBSXA1irkkQUfzfLvNPv0N9im65hXY=;
	h=From:To:Cc:Subject:Date:From;
	b=fENlUVZ+IzGo74oxqoF6Zyc0XwlvqAKBDIvQNc47T0rPKrx1aQbXLYBEO51842aK7
	 qiphnBOWcTHVKhxfylp6NEoa+MI4pnMZIgfxpKDco/QxYoOnrAN1YCGLWbJI90XTse
	 ajyNclf9gB+Fnl+zRn0ZtZokpqwr6Dg3mVn+oVi1fJK0wC8amH2z+HQN41hNNx0TfZ
	 +VGK/UHF3UeAQlKiwafAAL8oHA0OOpWUckTjoLEU/D1f93hCrzGXn4d81mtI90ZI6S
	 uGi7tXpHgYAKe5rk/GCM6O+EOZrzK2i9uSN2tXAI4JlHX/wk0ubnbcR35X+Ml5QeoD
	 a/oNcM+6585jw==
To: sven@kernel.org,
	marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: j@jannau.net,
	neal@gompa.dev,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andre Eikmeyer <dev@deq.rocks>
Subject: [PATCH v2 0/3] Bluetooth: hci_bcm4377: resume after ACPI S3 and ASPM
Date: Wed, 11 Nov 2026 13:02:45 +0100
Message-ID: <20261111120248.21062-1-dev@deq.rocks>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After ACPI S3 the Bluetooth function of the BCM4377 comes back without
its firmware. Patch 2 probes it again after such a resume.

When the previous controller is still being released, the re-probe
registers the new one under another index, which runs into the probe
return check fixed in patch 1. Patch 1 is a fix on its own and goes
first.

Patch 3 is new in v2. Because of a hardware erratum the driver keeps
ASPM disabled on the whole link to the Wi-Fi and Bluetooth chip for as
long as it is bound, which holds the CPU package at PC3.
Patch 3 disables ASPM only while the firmware boots and restores it
once the firmware runs, also after the re-probe from patch 2.

The Wi-Fi function of the same chip needs the same after S3 and goes to
linux-wireless in "wifi: brcmfmac: pcie: S3 suspend and resume on the
T2 Mac chips".

Successfully ested on MacBookAir9,1 and MacBookPro15,4.

v1 [1] has not received any feedback yet.

Changes in v2:
- Add patch 3, keep ASPM off only while the firmware boots
- Patches 1 and 2 are unchanged

[1] https://lore.kernel.org/all/20261107154839.89941-1-dev@deq.rocks/

Andre Eikmeyer (3):
  Bluetooth: hci_bcm4377: treat only negative hci_register_dev() returns
    as errors
  Bluetooth: hci_bcm4377: probe again after a resume through firmware
  Bluetooth: hci_bcm4377: keep ASPM off only while the firmware boots

 drivers/bluetooth/hci_bcm4377.c | 93 +++++++++++++++++++++++++++++----
 1 file changed, 83 insertions(+), 10 deletions(-)


base-commit: 3f425f95ba3923d605f6a8b382e8fcdc59d479db
