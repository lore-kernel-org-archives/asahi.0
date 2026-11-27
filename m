Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.212
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795800960;
	b=MgmBJSRoUmoBwjVPaFJBabOVtUWPHLkY7/i9vzOzIydCsn55umBsMhTTQ8fGt7hm8NGx
	 1E2cAnlA7SUrA2cHRtR0cGzz68EHKjZ5Fk3VHppXcwsLJs6HJGKRRFmJ9UZZr+2YtlSBP
	 ouW09b0XEYmk/AhAc2n3Hfrz4C6tKCDMYJUY8gGtYH2k6xqPe5eP34GSdR/cpjBe6jK7s
	 vPQ/GkoZY4Y0csJo29N4W0jFdtyaTW9+NDiFsBlPhSiXJ1FD5w2+7yxG8OuhitO3BlwSi
	 n7zcIF2bUzl6C6/3ShXjh4aHewLw76qvdg/zYHSYDDzK7RY0hbuS3ZkZPuC2eXRat1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795800960;
	h=DMARC-Filter:From:X-Lima-ML-UUID:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=duUjDN5fxT3uLbdNBTlIvjfudAaUyHlLBvOG4MbFSSY=;
	b=0ypzb3tUfZmjkQdz4bQ3ktEh6m6wfm+q0HtRtdXk6m1DnylqNZ9iKye2j1VOLMA9fViq
	 cbSGytD5Yd7EIVJ3chuGpUoT9Kx/9iuGWmPPQ3JkWys7tZtG0TZoaLNX5h6cgNL+v3es6
	 r9ZZKC5tuWiBAGzE913cF33NWb3AZb/fFy8WjEI+1nK+38E7fgYOwVg8yQ+u1MGXhAh5S
	 qrUFN5W7fFt4cRG2vV40e5yWKX3MYwUdNsqmP9wFYF/zUTqU8udetMkDYwvMFYuYarbHv
	 IscO1HcNMnzrWN6cki3jKp9NV5128YUGQbB19tHXGE+RZzEW8/oKLFnG7wd31pzExxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=Xs8KuWlJ;
	arc=none smtp.remote-ip=91.216.248.212
Received: from bulk0.mail-out.lima-city.de (bulk0.mail-out.lima-city.de [91.216.248.212])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0C1606A31C;
	Fri, 27 Nov 2026 17:35:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B0C1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=Xs8KuWlJ
From: Andre Eikmeyer <dev@deq.rocks>
X-Lima-ML-UUID: 5d882cb8-b7e5-42b8-96d5-d8abe38b4ced
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1795800956;
	bh=Y5DFtHB7VMkbjfcMnVp9GefPuYs+p+pahTbIQITFBX0=;
	h=From:To:Cc:Subject:Date:From;
	b=Xs8KuWlJVaZxeyZ4c/vPKJ82j6q8N/7TpDrJ5ba6Dz4kHIWTFulqJtduS+mNHLPQ+
	 YlosfwlGa4864kt2qE9NfO8/1SHYSfPY5bsrJAYjOlnl61Zt8m4R+ZMHEOGG22okgA
	 mFTm63TNlfekpINZdRTBJudFX6ZlosOWGHt/aREsg66nPwyGWYVwbNBJA6GQn5ubrA
	 rvi3ab6vlC+WwMxJGqIeuoHdEVhRK2EHh5OcWrXq+eWq0TAza6DAHeraZA8S3248bu
	 gKNzvtkyYYzAmz/8zJlCCoqzbRl4ix1FnM+tJReJw2yNHONTgO2jHlHVh63NEHSFDb
	 gD+kIP7A3t8GQ==
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	michael.reeves077@gmail.com,
	marcan@marcan.st,
	j@jannau.net,
	asahi@lists.linux.dev,
	sebastian.reichel@collabora.com,
	Soeren Coremans <sorencoremans@gmail.com>,
	Andre Eikmeyer <dev@deq.rocks>
Subject: [PATCH wireless-next v3 0/5] wifi: brcmfmac: pcie: S3 and deep sleep on the T2 Mac chips
Date: Fri, 27 Nov 2026 18:35:44 +0100
Message-ID: <20261127173549.29335-1-dev@deq.rocks>
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

These are follow-ups to Michael Reeves' BCM4388 series, which is now
in wireless-next.

- Patch 1: D0_INFORM on resume now goes through the control ring,
  which refuses to write while the PCIe state is DOWN. Set the state
  first.
- Patch 2: The BCM4364 halts on the host ready doorbell at init. Skip
  the doorbell there.
- Patch 3: The BCM4364 and BCM4377 come back from S3 without firmware.
  Probe them again.
- Patch 4: The BCM4377 returns the tx status only once the flowring
  delete is sent. Do not wait for it before.
- Patch 5: Add deep sleep for the BCM4364 and BCM4377, so the package
  reaches PC10.

Patch 3 reuses the existing re-probe in brcmf_pcie_pm_leave_D3().
"wifi: brcmfmac: pcie: recover from fatal PCIe errors" [3] adds a
second re-probe after a PCIe error.

Both run under the device lock, but a PCIe error during resume can
still start both. Whichever series lands second should skip the
re-probe in brcmf_pcie_pm_leave_D3() while in_pci_recovery is set.

Patch 5 does not wake a device that is down, so the remove after a
link reset does not stall.

The Bluetooth function of the BCM4377 gets the same resume handling in
"Bluetooth: hci_bcm4377: resume after ACPI S3 and ASPM" on
linux-bluetooth.

Successfully tested with S3 and deep sleep on the BCM4364B2
(MacBookPro15,1), the BCM4364B3 (MacBookPro16,1) and the BCM4377
(MacBookAir9,1).

The T2 Linux community runs v2 of this series.

Changes in v3:
- Rebased on wireless-next, which has Michael's series now
- Patch 1: add the Fixes tag and Arend's Ack
- Patch 2: limit it to the BCM4364, B2 and B3, reword the commit
  message and add the Fixes tag
- Patch 3: limit it to the BCM4364 and BCM4377
- Patch 4: keep the wait on all chips but the BCM4377. On the BCM4364B3
  a tx status came after the delete response once, so it keeps the
  wait as well. Commit ae13aa2ec885 already resets the counter when a
  flowring is created
- Patch 5:
  - limit it to the BCM4364 and BCM4377 with the mailbox on the
    control ring
  - check for the interrupt thread instead of in_irq
  - handle a deep sleep message that fails to send
  - wake the device in remove, disable deep sleep under ds_lock and
    cancel the deassert work right after, before brcmf_detach() frees
    the rings the work writes to
  - give up waking a device that is not up
  - clear ds_suspend when entering D3 fails
  - DS_INBAND_DW comes on top of DS_NO_OOB_DW, as Broadcom's DHD driver
    sets it

[1] v2: https://lore.kernel.org/all/20261111120748.23795-1-dev@deq.rocks/
[2] v1: https://lore.kernel.org/all/20261107154810.89780-1-dev@deq.rocks/
[3] https://lore.kernel.org/all/20261105215954.184290-1-sorencoremans@gmail.com/

Andre Eikmeyer (5):
  wifi: brcmfmac: pcie: set the state before D0_INFORM on resume
  wifi: brcmfmac: pcie: skip the host ready doorbell at init on the
    BCM4364
  wifi: brcmfmac: pcie: probe again after a resume through firmware
  wifi: brcmfmac: msgbuf: do not wait for tx status on the BCM4377
  wifi: brcmfmac: pcie: support inband device wake and deep sleep

 .../broadcom/brcm80211/brcmfmac/commonring.c  |  14 +
 .../broadcom/brcm80211/brcmfmac/commonring.h  |   5 +
 .../broadcom/brcm80211/brcmfmac/msgbuf.c      |  10 +-
 .../broadcom/brcm80211/brcmfmac/pcie.c        | 323 +++++++++++++++++-
 4 files changed, 344 insertions(+), 8 deletions(-)


base-commit: 18d0bedbb5f0538396cb7f763ed9cd1dd69c5b23
-- 
2.56.0

